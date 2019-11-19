//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
@ObservedObject var order = Order()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker(selection: $order.cake.type, label: Text("Select flavor")) {
                        ForEach(0..<Order.types.count){
                            Text("\(Order.types[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                    
                    Stepper(value: $order.cake.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.cake.quantity)")
                    }
                }
                
                Section{
                    Toggle(isOn: $order.cake.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    if order.cake.specialRequestEnabled{
                        Toggle(isOn: $order.cake.addSprinkles) {
                            Text("Add Sprinkles?")
                        }
                        Toggle(isOn: $order.cake.extraFrosting) {
                            Text("Add extra Frosting?")
                        }
                    }
                    
                }
                Section{
                    NavigationLink(destination: AddressView(order: self.order)) {
                        Text("Delivery details")
                    }
                   
                }
                
            }
        .navigationBarTitle("Cupcake Corner")
        }
        
    }
    
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
