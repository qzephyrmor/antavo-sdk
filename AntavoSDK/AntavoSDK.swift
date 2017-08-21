//
//  SDK.swift
//  AntavoSDK
//
//  Created by AntavoDev on 21/08/17.
//  Copyright © 2017 Antavo Ltd. All rights reserved.
//

import UIKit

public class AntavoSDK: NSObject {
    static let get = AntavoSDK()
    
    private var apiKey: String?
    
    private var client: Client?
    
    private var customer: Customer?
    
    public func getApiKey() throws -> String {
        if let apiKey = self.apiKey {
            return apiKey
        }
        
        throw Exception.RuntimeError("API key is not set")
    }
    
    public func setApiKey(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func getClient() throws -> Client {
        if nil == self.client {
            do {
                let apiKey = try self.getApiKey()
                self.client = Client(apiKey: apiKey)
            } catch {
                throw Exception.RuntimeError("Client is not initializable")
            }
        }
        
        return self.client!
    }
    
    public func getAuthenticatedCustomer() throws -> Customer {
        if let customer = self.customer {
            return customer
        }
        
        throw Exception.RuntimeError("Customer is not initialized")
    }
    
    public func getCustomer(customerId: String) -> Customer {
        // TODO: implement customer fetching mechanism.
        return Customer()
    }
    
    public func registerCustomer(customerId: String, properties: NSArray) throws -> Customer {
        // TODO: implement customer registration mechanism.
        return Customer()
    }
    
    public func sendEvent(action: String, properties: NSArray) throws {
        // TODO: implement event sending mechanism.
    }
    
    public func getReward(rewardId: String) throws -> Reward {
        // TODO: implement reward fetching mechanism.
        return Reward()
    }
    
    public func getRewards() throws -> [Reward] {
        // TODO: implement rewards fetching mechanism.
        return []
    }
    
    public func claimReward(rewardId: String) throws {
        do {
            try customer = self.getAuthenticatedCustomer()
            
            // TODO: implement reward claim mechanism.
        } catch Exception.RuntimeError {
            
        }
        
    }
    
    public func reinitialize(apiKey: String) -> AntavoSDK {
        self.apiKey = apiKey
        self.client = Client(apiKey: self.apiKey!)
        return self
    }
}
