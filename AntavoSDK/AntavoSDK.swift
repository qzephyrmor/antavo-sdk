//
//  SDK.swift
//  AntavoSDK
//
//  Created by AntavoDev on 21/08/17.
//  Copyright © 2017 Antavo Ltd. All rights reserved.
//

import UIKit
import Alamofire

// MARK: Antavo Loyalty Swift SDK core object.
open class AntavoSDK: NSObject {
    /**
     Possibility to generalize SDK initialization; make sure that SDK is 
     initialized only once.
     */
    static let get = AntavoSDK()
    
    /**
     A valid API key issued by Antavo. All requests with invalid API key will 
     result in an error and the request to fail.
     */
    fileprivate var apiKey: String
    
    /**
     Cached REST client for communicating with Antavo API.
     */
    fileprivate var client: Client?
    
    /**
     Stores the initialized Antavo Customer object.
     */
    fileprivate var customer: ANTCustomer?
    
    /**
     Returns a simplified settings object with only the brand setting key and value.
     */
    fileprivate var settings: [String: Any]?
    
    /**
     Returns the stored valid API key issued by Antavo. All requests with invalid
     API key will result in an error and the request to fail.
     */
    open func getApiKey() -> String {
        return self.apiKey
    }
    
    /**
     Explicitly set the stored Antavo API key. 
     Note that you need to reinitialize SDK to make changes on REST client too.
     */
    open func setApiKey(_ apiKey: String) {
        self.apiKey = apiKey
    }
    
    /**
     Returns the cached REST client for communicating with Antavo API.
     */
    open func getClient() -> Client {
        if let client = self.client {
            return client
        }
        
        self.client = Client(apiKey: self.getApiKey())
        return self.client!
    }
    
    /**
     Mechanism for fetching initialized brand settings.
     */
    open func getSettings(completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
        self.getClient().get("/settings", completionHandler: completionHandler)
    }
    
    /**
     Returns the current customer object cached in self::customer.
     */
    open func getAuthenticatedCustomer() throws -> ANTCustomer {
        if let customer = self.customer {
            return customer
        }
        
        throw Exception.runtimeError("No authenticated customer found")
    }
    
    /**
     Authenticates a loyalty customer for a SDK session.
     
     - Parameter customerId: Customer's unique identifier as string.
     */
    open func authenticateCustomer(_ customerId: String) throws -> ANTCustomer {
        //self.customer = try self.getCustomer(customerId)
        //return self.customer!
        return ANTCustomer()
    }

    /**
     Returns a loyalty customer by given customer id.
     
     - Parameter customerId: Customer unique identifier.
     */
    open func getCustomer(_ customerId: String, completionHandler: @escaping (ANTCustomer?, Error?) -> ()) {
        self.getClient().get("/customers/" + customerId) { response, error in
            if let result = response {
                completionHandler(ANTCustomer().assign(data: result), error)
            } else {
                completionHandler(nil, error)
            }

        }
    }
    
    /**
     Registers a loyalty customer through the Antavo API.
     
     - Parameter customerId: Customer unique identifier.
     - Parameter properties: Customer properties as associative collection.
     */
    open func registerCustomer(_ customerId: String, properties: [String: Any] = [:]) throws -> ANTCustomer {
        // TODO: implement customer registration mechanism.
        return ANTCustomer()
    }
    
    /**
     Sends an event to the Antavo API endpoint.
     
     - Parameter action: Action name.
     - Parameter parameters: Custom data (key-value pairs) to store with the event.
     */
    open func sendEvent(_ action: String, parameters: [String: Any] = [:], completionHandler: @escaping (NSDictionary?, Error?) -> ()) throws {
        try self.getClient().postEvent(action, customer: self.getAuthenticatedCustomer(), completionHandler: completionHandler)
    }
    
    /**
     Mechanism for fetching a reward entry by specified identifier from Antavo API.
     
     - Parameter rewardId: Reward's unique identifier.
     */
    open func getReward(_ rewardId: String) throws -> Reward {
        // TODO: implement reward fetching mechanism.
        return Reward()
    }
    
    /**
     Mechanism for fetching all rewards from Antavo API.
     */
    open func getRewards() throws -> [Reward] {
        // TODO: implement rewards fetching mechanism.
        return []
    }
    
    /**
     Mechanism for claiming a reward in Antavo.
     
     - Parameter rewardId: Reward's unqiue identifier.
     */
    open func claimReward(_ rewardId: String) throws {
        do {
            try customer = self.getAuthenticatedCustomer()
            
            // TODO: implement reward claim mechanism.
        } catch Exception.runtimeError {
            
        }
    }
    
    /**
     Initializes the Swift SDK with the given API key.
     
     - Parameter apiKey: Antavo API key.
     */
    public init(apiKey: String = "") {
        self.apiKey = apiKey
    }
    
    /**
     Reinitializes the Swift SDK with the given API key.
     
     - Parameter apiKey: Antavo API key.
     */
    open func reinitialize(_ apiKey: String) -> AntavoSDK {
        self.apiKey = apiKey
        self.client = Client(apiKey: self.getApiKey())
        return self
    }
}
