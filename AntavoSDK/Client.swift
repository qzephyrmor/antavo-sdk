//
//  Client.swift
//  AntavoSDK
//
//  Copyright © 2017 Antavo Ltd. All rights reserved.
//

import Alamofire

// MARK: AntavoSDKClient
open class Client: NSObject {
    /**
     Specifies Antavo base API url.
     */
    fileprivate let baseURL = "https://api-apps-rc.antavo.com"
    
    /**
     Specifies Antavo Events API url.
     */
    fileprivate let eventsApiURL = "https://api-apps-rc.antavo.com/events"
    
    /**
     Stores internally the API authorization key.
     */
    fileprivate var apiKey: String
    
    /**
     Converts request URLs to an URL object.
    
     - Parameter url: request url to convert
     */
    open func prepareUrl(_ url: String) -> URL {
        return URL(string: self.baseURL + url)!
    }
    
    /**
     Initializes the SDK Client object with the given API key.
     
     - Parameter apiKey: Antavo API key.
     */
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    /**
     Returns an array with prepared request parameters.
     */
    open func prepareParameters(_ parameters: [String: Any]) -> [String: Any] {
        var result = parameters
        result["api_key"] = self.apiKey
        return result
    }
    
    /**
     Parses API JSON response into a generic NSDictionary object.
     
     - Parameter response: Antavo API response in JSON format.
     */
    open func parseResponse(_ response: String) -> NSDictionary? {
        var dictonary: NSDictionary?
        
        if let data = response.data(using: String.Encoding.utf8) {
            do {
                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                
                if let parsed = dictonary {
                    return parsed
                }
            } catch let error as NSError {
                print(error)
            }
        }
        
        return nil
    }
    
    /**
     Performs a GET request to the specified URL with given parameters.
     
     - Parameter url: Relative URL to the base API URL.
     - Parameter parameters: Request query parameters as associative collection.
     */
    open func get(_ url: String, parameters: [String: Any] = [:], completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
        Alamofire
            .request(self.prepareUrl(url), method: .get, parameters: self.prepareParameters(parameters))
            .responseJSON { response in
                switch response.result {
                    case .success(let value):
                        completionHandler(value as? NSDictionary, nil)
                    case .failure(let error):
                        completionHandler(nil, error)
                }
        }
    }
    
    /**
     Performs a POST request to the specified URL with given parameters.
     
     - Parameter url: Relative URL to the base API URL.
     - Parameter parameters: Request body parameters as associative collection.
     */
    open func post(_ url: String, parameters: [String: Any] = [:], completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
        Alamofire
            .request(self.prepareUrl(url), method: .post, parameters: self.prepareParameters(parameters))
            .responseJSON { response in
                switch response.result {
                    case .success(let value):
                        completionHandler(value as? NSDictionary, nil)
                    case .failure(let error):
                        completionHandler(nil, error)
                }
            }
    }
    
    /**
     Performs a POST request through the Antavo Events API.
     
     - Parameter action: Denotes an existing factory or custom action name.
     - Parameter customer: A customer object with a unique customer ID either matching an existing customer in Antavo.
     - Parameter parameters: Event data parameters as associative collection.
     */
    open func postEvent(_ action: String, customer: ANTCustomer, parameters: [String: Any] = [:], completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
        // Appending given action and customer's id to the request parameters.
        var request = parameters
        request["action"] = action
        request["customer"] = customer.id
        
        self.post(self.eventsApiURL, parameters: self.prepareParameters(request), completionHandler: completionHandler)
    }
}
