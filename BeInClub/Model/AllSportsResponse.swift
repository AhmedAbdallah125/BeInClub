//
//  AllSportsResponse.swift
//  BeInClub
//
//  Created by Ahmed on 05/05/2022.
//

import UIKit

class AllSportsResponse: Codable {
    let sports:[Sport]
    
    internal init(sports: [Sport]) {
        self.sports = sports
    }
    
}
