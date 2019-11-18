//
//  File.swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

class Customer: ObservableObject{
    let id = UUID()
    @Published var name: String = ""
    @Published var Address: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
}
