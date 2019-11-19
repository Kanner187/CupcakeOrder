//
//  User-type .swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

struct Cake: Codable{
    
    var type: Int = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet{
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
     var extraFrosting = false
     var addSprinkles = false
    
     var name: String = ""
     var Address: String = ""
     var city: String = ""
     var zip: String = ""
    
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


class Order: ObservableObject , Codable{
    static var types = ["Vanilla" , "Strawberry" , "Chocolate" , "Rainbow"]
    
    @Published var cake = Cake()
    
    enum CodingKeys: CodingKey {
        case cake
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cake = try container.decode(Cake.self, forKey: .cake)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cake, forKey: .cake)
    }
    
    init(){
        
    }
    
}
