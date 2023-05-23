//
//  LeagueModel.swift
//  SoccerWorld
//
//  Created by Marco Alonso Rodriguez on 22/05/23.
//

import Foundation

struct LeagueResponseModel : Decodable {
    var result : [LeagueModel]
    var success : Int?
}

struct LeagueModel : Decodable {
    var league_key : Int?
    var league_name : String?
    var league_logo : String?
    var country_key : Int?
    var country_name : String?
    var country_logo: String?
}
