//
//  URLs.swift
//  BeInClub
//
//  Created by Ahmed on 05/05/2022.
//

import UIKit

class URLs: NSObject {
    public static var getAllTeams : String = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php"
    
    
    public static var getEventForLeague :String =
    "https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=4328&r=38&s=2021-2022"
}
