//
//  Item.swift
//  FinalLabAssignment-C0757769
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class Item
{
    var id : String
    var price : Double
    var name : String
    var description : String
    
    
    init(id : String,name : String,description : String, price: Double)
    {
        self.id = id
        self.description = description
        self.name = name
        self.price = price
    }
    
    init()
    {
        self.id = String()
        self.description = String()
        self.name = String()
        self.price = Double()
        
    }
}
