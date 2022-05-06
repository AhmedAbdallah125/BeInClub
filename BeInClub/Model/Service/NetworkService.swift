//
//  NetworkService.swift
//  BeInClub
//
//  Created by Ahmed on 05/05/2022.
//

import UIKit
import Alamofire
class NetworkService: NSObject {

    static func fetchAllTeamsData(league : String = "English_Premier_League" ,completion : @escaping (AllTeams?, Error?)->()){
        
       
        struct AllTeamsParamter : Encodable{
            let l : String
        }
        let leagueName = AllTeamsParamter(l: league)
        AF.request(URLs.getAllTeams,parameters: leagueName)
            .validate()
            .responseDecodable(of: AllTeams.self) { (response) in
                switch response.result {
                case .success( _):
                    print("success")
                    guard let teamsData = response.value else {
                        print("error")
                        return }
                    
                    completion(teamsData,nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil , error)
                    
                        
                }
            }
    }
    
    static func fetchUpComingEvent(id :String = "4328" ,round :String = "38", season :String = "2021-2022", completion : @escaping(AllEvents?,Error?)->()){
        struct allEventParamters : Encodable{
            let id :String
            let r : String
            let s : String
        }
        let parameters = allEventParamters(id: id, r: round, s: season)
        
        AF.request(URLs.getEventForLeague,parameters: parameters)
            .validate()
            .responseDecodable(of: AllEvents.self) { (response) in
                
                switch response.result{
                case .success(_):
                    print("dataaaa success")
                    guard let eventsData = response.value else{
                        print("error")
                        
                        return
                    }
                    completion(eventsData, nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil,error)
                }
            }
    }
    
    
    
    static func fetchLastEvents(id :String = "4328" ,round :String = "35", season :String = "2021-2022", completion : @escaping(LastResults?,Error?)->()){
        struct allEventParamters : Encodable{
            let id :String
            let r : String
            let s : String
        }
        let parameters = allEventParamters(id: id, r: round, s: season)
        
        AF.request(URLs.getEventForLeague,parameters: parameters)
            .validate()
            .responseDecodable(of: LastResults.self) { (response) in
                
                switch response.result{
                case .success(_):
                    print("data success")
                    guard let eventsData = response.value else{
                        print("error")
                        
                        return
                    }
                    print(eventsData)
                    completion(eventsData, nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil,error)
                }
            }
    }
    
}


