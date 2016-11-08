//
//  AntavoSDK.swift
//  AntavoSDK
//
//  Created by Fekete Zsolt on 11/8/16.
//  Copyright © 2016 Fekete Zsolt. All rights reserved.
//

import Foundation
public class AntavoSDK {
    
    static let get = AntavoSDK()
    
    private var api_key: String = ""
    
    private var api_secret: String = ""
    
    private var customer: String = ""
    
    private let api_url: String = ""
    
    private let events_api_url: String = ""
    
    private let customers_api_url: String = ""
    
    public func getAPIKey() -> String {
        return self.api_key
    }
    
    public func setAPIKey(api_key: String) {
        self.api_key = api_key
    }
    
    public func getAPISecret() -> String {
        return self.api_secret
    }
    
    public func setAPISecret(api_secret: String) {
        self.api_secret = api_secret
    }
}
