//
//  NetworkingClient.swift
//  BandsinTownDemo
//
//  Created by stephan rollins on 10/20/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient
{
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    
    func execute(_ url: URL, completion: @escaping WebServiceResponse)
    {

        
        Alamofire.request(url, headers: ["x-api-key": "EJqbBuarkq7bNqBZgNnaA6hPG5b0HzAY1q6CBAF4"]).responseJSON(completionHandler: { response in
            
            if let error = response.error {
                completion(nil, error)
            }
            
            else if let jsonArr = response.result.value as? [[String: Any]]
            {
                completion(jsonArr, nil)
            }
            
            else if let jsonDictionary = response.result.value as? [String: Any]
            {
                completion([jsonDictionary], nil)
            }
        })
    }
}





















