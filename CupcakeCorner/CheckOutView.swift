//
//  CheckOutView.swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    @State private var showingAlert = false
    @State private var confirmationMessage = ""
    
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView {
                VStack{
                    Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                    
                    
                    Text("Your total cost is $\(self.order.cost , specifier: "%.2f")")
                        .font(.title)
                        .padding()
                    Button(action:{
                        self.placeOrder()
                    }){
                        Text("Place Order")
                    }
                .padding()
                }
            }
            .navigationBarTitle("Check Out", displayMode: .inline)
        }
        .alert(isPresented: $showingAlert) { () -> Alert in
            Alert(title: Text("confirmation"), message: Text(self.confirmationMessage), dismissButton: .default(Text("Okay")))
        }
        
    }
    func placeOrder(){
        guard let data = try? JSONEncoder().encode(order) else {
            print("Encoding of data failed")
            return
        }
        //Configuring network request
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                self.confirmationMessage = "An error occurred: \(error?.localizedDescription ?? "Unknown error")"
                self.showingAlert = true
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data){
                self.confirmationMessage = "Your order for \(self.order.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes will be delivered soon!"
                self.showingAlert = true
            }else{
                print("Invalid response from server")
            }
            
        }.resume()
        
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
