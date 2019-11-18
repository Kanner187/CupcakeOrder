//
//  User-type .swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Response: Codable{
    var results: [Result]
}



class User: ObservableObject , Codable {
    
    enum CodingKeys: CodingKey{
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
   @Published var name = "Levit Osei-Wusu"
}
