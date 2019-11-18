//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var hasInvalidAddress: Bool {
        if order.name.isEmpty || order.Address.isEmpty || order.city.isEmpty || order.zip.isEmpty {
            return true
        }
        
       return false
    }

    var body: some View {
        Form{
            Section(header:Text("Name")){
                TextField("Enter name", text: $order.name)
            }
            Section(header: Text("Address")){
                TextField("Enter Address", text: $order.Address)
            }
            Section(header: Text("City")){
                TextField("Enter city", text: $order.city)
            }
            Section(header: Text("Zip").font(.subheadline)){
                TextField("Enter zip code", text: $order.zip)
            }
            
            Section{
                NavigationLink(destination: CheckOutView(order: self.order)) {
                    Text("Check out")
                }
            }
        .disabled(hasInvalidAddress)
            
        }
        .navigationBarTitle("Order Details" , displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var order = Order()
    
    static var previews: some View {
        AddressView(order: order)
    }
}
