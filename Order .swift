//
//  User-type .swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

class Order: ObservableObject{
    static let types = ["Vanilla" , "Strawberry" , "Chocolate" , "Rainbow"]
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequestEnabled = false {
        didSet{
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name: String = ""
    @Published var Address: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
    
    var cost: Double{
        var cost = Double(quantity) * 2
        
        //complicated cakes
        cost += (Double(type)/2)
        
        if extraFrosting{
            cost += Double(quantity)
        }
        
        if addSprinkles{
            cost += Double(quantity/2)
        }
        return cost
    }
    
}
