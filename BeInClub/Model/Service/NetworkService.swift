//
//  NetworkService.swift
//  BeInClub
//
//  Created by Ahmed on 05/05/2022.
//

import UIKit
import Alamofire

protocol NetworkProtocol{
    static func getAllSportsResponse(completionHandler : @escaping(AllSportsResponse?)->Void )
}

class NetworkService: NetworkProtocol {
    // for all sports response
    static func getAllSportsResponse(completionHandler: @escaping(AllSportsResponse?) -> Void) {
        //Using AlamoFire
        Session.default.request(URLs.allSportsURL)
            .responseDecodable(of:AllSportsResponse.self) {
                response in
                switch response.result {
                case .success(let data):
                    completionHandler(data)
                case .failure(let error):
                    print(error)
                    completionHandler(nil)
                }
            }
        
    }
    
    
}
