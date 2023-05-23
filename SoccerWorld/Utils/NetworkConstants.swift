//
//  NetworkConstants.swift
//  SoccerWorld
//
//  Created by Marco Alonso Rodriguez on 22/05/23.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var apiKey: String {
            return "357d37b895f03bd497c21c40e30ab631b688df5d22c7f060d9e576843ec685ee"
    }
    
    public var baseUrl: String {
        return "https://apiv2.allsportsapi.com/football/?met="
    }
}
