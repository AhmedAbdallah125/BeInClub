//
//  LocalSource.swift
//  BeInClub
//
//  Created by AbdElrahman sayed on 09/05/2022.
//

import Foundation
import CoreData
class LocalSorce{
    let context : NSManagedObjectContext
    let entity : NSEntityDescription
    init(appDelegete : AppDelegate){
       context  = appDelegete.persistentContainer.viewContext
        entity  = NSEntityDescription.entity(forEntityName: "FavList", in: context)!
    }
    
    
    func saveLeagueToCoreData(leagueId:String,leagueName:String, leagueBadge :String , leagueYoutube :String) throws{
        let league = NSManagedObject(entity: entity, insertInto: context)
           league.setValue(leagueId, forKey: "leagueID")
           league.setValue(leagueBadge, forKey: "leagueImgURL")
           league.setValue(leagueName, forKey: "leagueName")
           league.setValue(leagueYoutube, forKey: "strYoutube")
           
           do{
               try context.save()
           }catch let error as NSError{
              throw error
           }
       }
    
    func fetchCoredate () -> [FavLeagues]{
        
        var leagues : [FavLeagues] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavList")

        do {
            let results = try context.fetch(fetchRequest)
            for league in results{
                
                leagues.append(FavLeagues(leagueName: league.value(forKey: "leagueName") as! String,
                                          leaugeImaURL: league.value(forKey: "leagueImgURL") as! String,
                                          leagueID: league.value(forKey: "leagueID") as! String,
                                          strYoutube: league.value(forKey: "strYoutube") as! String)
                )
            }
        }catch let err as NSError {
            print(err.debugDescription)
        }
      
        return leagues
    }
    
     func isFavorite(id: String)->Bool{
        for  league in fetchCoredate() {
            if(id == league.leagueID){
                return true
            }
               
        }
        return false
    }
    
    func removeFromCoreData(id:String) throws{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavList")
        let myPredicate = NSPredicate(format: "leagueID == %@", id)
        fetchRequest.predicate = myPredicate
        do{
            let leagueList = try context.fetch(fetchRequest)
            for league in leagueList{
                context.delete(league)
            }
            try self.context.save()
        }catch let error as NSError{
            throw error
        }
    }
    
   
}
