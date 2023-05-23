//
//  SoccerManager.swift
//  SoccerWorld
//
//  Created by Marco Alonso Rodriguez on 22/05/23.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case badURL
    case badRequest
}

struct SoccerManager {
    
    func getLeagues(completion: @escaping ([LeagueModel]?, Error?) -> Void){
        guard let url = URL(string: "\(NetworkConstants.shared.baseUrl)Leagues&APIkey=\(NetworkConstants.shared.apiKey)") else {
            completion(nil, NetworkError.badURL)
            return
        }
        print("Debug: url \(url)")

        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil, NetworkError.badRequest)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(LeagueResponseModel.self, from: data)
                let listOfLeagues = decodedData.result
                completion(listOfLeagues, nil)
            } catch {
                print("Debug: error \(error.localizedDescription)")
            }
            
        }.resume()
    }
}
