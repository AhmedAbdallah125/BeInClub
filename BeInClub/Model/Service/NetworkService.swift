//
//  NetworkService.swift
//  BeInClub
//
//  Created by Ahmed on 05/05/2022.
//

import UIKit
import Alamofire

protocol AllLeaguesService {
    static func getAllLeagues(compilationHandeler : @escaping ([League]?) -> Void)
}

protocol NetworkProtocol{
    static func getAllSportsResponse(completionHandler : @escaping(AllSportsResponse?)->Void )
}

class NetworkService : AllLeaguesService, NetworkProtocol {

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
    
    static func getAllLeagues(compilationHandeler: @escaping ([League]?) -> Void) {
        
        AF.request(URLs.LEAGUES_URL, method: .get)
            .response{ (response) in
                
                guard let data = response.data else { return }
                
                print(data.count)
                
                do {
                    let leagues = try JSONDecoder().decode(LeagueResult.self, from: data)
                    
                    compilationHandeler(leagues.countrys)

                } catch {
                    print(error)
                    compilationHandeler(nil)
                }
                
            }
            
    }
    
}
