//
//  Sport.swift
//  BeInClub
//
//  Created by Ahmed on 05/05/2022.
//

import UIKit

class Sport: Codable {
    
    let idSport, strSport: String
    let strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
    
    internal init(idSport: String, strSport: String, strFormat: String, strSportThumb: String, strSportIconGreen: String, strSportDescription: String) {
        self.idSport = idSport
        self.strSport = strSport
        self.strFormat = strFormat
        self.strSportThumb = strSportThumb
        self.strSportIconGreen = strSportIconGreen
        self.strSportDescription = strSportDescription
    }
}
