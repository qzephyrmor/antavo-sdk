//
//  Customer.swift
//  AntavoSDK
//
//  Created by AntavoDev on 21/08/17.
//  Copyright © 2017 Antavo Ltd. All rights reserved.
//

import UIKit

// MARK: Base Antavo Customer object.
open class ANTCustomer: NSObject {
    open var id: String = ""
    
    open var firstName:String = ""
    
    open var lastName: String = ""
    
    open var handler: String = ""
    
    open var email: String = ""
    
    open var score: Int = 0
    
    open var spent: Int = 0
    
    open var status: String = ""
    
    /**
     Creates a new instance of Customer, and assigns the given properties to it.
     
     - Parameter data: Properties to assign as NSDictionary object.
     */
    open func assign(data: NSDictionary) -> ANTCustomer {
        let customer = ANTCustomer()
        
        if let id = data.object(forKey: "id") {
            customer.id = id as! String
        }
        
        if let firstName = data.object(forKey: "first_name") {
            customer.firstName = firstName as! String
        }
        
        if let lastName = data.object(forKey: "last_name") {
            customer.lastName = lastName as! String
        }
        
        if let handler = data.object(forKey: "handler") {
            customer.handler = handler as! String
        }
        
        if let email = data.object(forKey: "email") {
            customer.email = email as! String
        }
        
        if let score = data.object(forKey: "score") {
            customer.score = score as! Int
        }
        
        if let spent = data.object(forKey: "spent") {
            customer.spent = spent as! Int
        }
        
        if let status = data.object(forKey: "status") {
            customer.status = status as! String
        }
        
        return customer
    }
}
