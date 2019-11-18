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
                        
                    }){
                        Text("Place Order")
                    }
                .padding()
                }
            }
            .navigationBarTitle("Check Out", displayMode: .inline)
        }
        
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
