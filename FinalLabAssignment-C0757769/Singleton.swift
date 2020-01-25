//
//  Singleton.swift
//  FinalLabAssignment-C0757769
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class Singleton: NSObject
{
    private var productArray = [Item]()
    
    private static var obj = Singleton()
    
    
    private override init() {
        
    }
    
    internal static func getInstance() -> Singleton
    {
        return obj
    }
    func createCust()
    {
        let i1 = Item(id: "p01", name: "Pasta", description: "White Alfredo Pasta", price: 50.0)
        productArray.append(i1)
        let i2 = Item(id: "p02", name: "Sandwich", description: "White Alfredo Pasta", price: 50.0)
        let i3 = Item(id: "p03", name: "Coffee", description: "White Alfredo Pasta", price: 60.0)
        let i4 = Item(id: "p04", name: "Danish", description: "White Alfredo Pasta", price: 20.0)
        let i5 = Item(id: "p05", name: "Bagel", description: "White Alfredo Pasta", price: 10.0)
        let i6 = Item(id: "p06", name: "Muffin", description: "White Alfredo Pasta", price: 70.0)
        let i7 = Item(id: "p07", name: "Cookie", description: "White Alfredo Pasta", price: 30.0)
        let i8 = Item(id: "p08", name: "Cheese", description: "White Alfredo Pasta", price: 10.0)
        let i9 = Item(id: "p09", name: "Donuts", description: "White Alfredo Pasta", price: 50.0)
        let i10 = Item(id: "p10", name: "Tea", description: "White Alfredo Pasta", price: 90.0)
        
        productArray.append(i2)
        productArray.append(i3)
        productArray.append(i4)
        productArray.append(i5)
        productArray.append(i6)
        productArray.append(i7)
        productArray.append(i8)
        productArray.append(i9)
        productArray.append(i10)
        
        
    }
    
    func returnProductArray() -> [Item]
    {
        return productArray
    }
    
//    func AddCustomer(customer: Customer)
//    {
//
//    }
    
    
//    func addNewCustomer(First_Name : String, Last_Name : String, email : String)
//    {
//
//    }
    
//    func returnProductObject(custID : Int) -> Item?
//    {
//        
//        
//    }
    
    func returnCount() -> Int
    {
        return productArray.count
    }
    
    
    
    
}
