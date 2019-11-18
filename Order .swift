//
//  User-type .swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

class Order: ObservableObject , Codable{
    
    enum CodingKeys: CodingKey{
        case type , quantity , extraFrosting , addSprinkle , name , address , city , zip
    }
    
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
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkle)
        
        name = try container.decode(String.self, forKey: .name)
        Address = try container.decode(String.self, forKey: .address)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkle)
        
        try container.encode(name, forKey: .name)
        try container.encode(Address, forKey: .address)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
        
    }
    
    init(){
        
    }
    
    
}
