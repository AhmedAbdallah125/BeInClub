//
//  LeagueDetailsDataClass.swift
//  BeInClub
//
//  Created by AbdElrahman sayed on 05/05/2022.
//

import Foundation


struct Team: Decodable{
    let idTeam: String
    let strTeam: String
    let strTeamBadge: String
    
}

struct AllTeams: Decodable {
    let teams: [Team]
}



struct AllEvents : Codable{
    let events : [Event]
}
struct Event : Codable{
    let strSeason : String
    let strHomeTeam :String
    let strAwayTeam :String
    let dateEvent :String
    let strTime :String
    
}


struct LastResults : Codable{
    let events : [LastEvents]
}

struct LastEvents : Codable{
    let strSeason : String
    let strHomeTeam :String
    let strAwayTeam :String
    let dateEvent :String
    let strTime :String
    let intHomeScore :String
    let intAwayScore :String
}
