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
                print("An error occurred: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
        }.resume()
        
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
