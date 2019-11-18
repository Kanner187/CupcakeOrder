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
                    Picker(selection:$order.type, label: Text("Select flavor")) {
                        ForEach(0..<Order.types.count){
                            Text("\(Order.types[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                    
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section{
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    if order.specialRequestEnabled{
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add Sprinkles?")
                        }
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra Frosting?")
                        }
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
