//
//  Client.swift
//  AntavoSDK
//
//  Created by AntavoDev on 21/08/17.
//  Copyright © 2017 Antavo Ltd. All rights reserved.
//

import UIKit
//import Alamofire

class Client: NSObject {
    let baseURL = "https://api-apps-rc.antavo.com"
    
    private let eventsApiUrl = "https://api-apps-rc.antavo.com/events"
    
    private var apiKey: String
    
    //private var lastResult: DataRequest?
    
    public func prepareUrl(_ url: String) -> URL {
        return URL(string: url)!
    }
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    /*public func get(url: String, parameters: [String: String] = [:]) -> DataRequest {
        return Alamofire.request(self.prepareUrl(url), method: .get, parameters: parameters)
    }
    
    public func post(url: String, parameters: [String: String] = [:]) -> DataRequest {
        return Alamofire.request(self.prepareUrl(url), method: .post, parameters: parameters)
    }*/
}
