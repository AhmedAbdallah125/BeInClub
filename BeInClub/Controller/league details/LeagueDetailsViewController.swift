//
//  LeagueDetailsViewController.swift
//  BeInClub
//
//  Created by AbdElrahman sayed on 02/05/2022.
//

import UIKit
import Kingfisher
import Reachability
import CoreData
class LeagueDetailsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    let localDataSource  = LocalSorce(appDelegete: UIApplication.shared.delegate as! AppDelegate)
    let reachability = try! Reachability()
    var leagueName : String?
    var leagueId : String?
    var leagueBage : String?
    var leagueYoutube : String?
    var showError : String = ""
    var allTeams : [Team] = []
    var upComingEvents : [Event] = []
    var lastEvents : [LastEvents] = []
    
    
    
    @IBOutlet weak var eventC: UICollectionView!
    @IBOutlet weak var teamsC: UICollectionView!
    
    @IBOutlet weak var resultC: UICollectionView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        leagueName = self.getLeagueName(leagueName: leagueName!)
        
        self.registerCollectionView()
        
        reachability.whenReachable = { reachability in
            // connect and get data from api
            self.setNavigationItem()
            self.fetchTeamsData()
            self.fetchUpcaomingEventsData()
            self.fetchLastResultsEvents()
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            //make alert
            self.showNoInternetAlert()
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == resultC{
            return lastEvents.count
            
        }
        if collectionView == teamsC{
            return allTeams.count
        }
        return upComingEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventC.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpcomingEventCollectionViewCell
        
        if(collectionView == eventC){
            let cell = eventC.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpcomingEventCollectionViewCell
            cell.backgroundColor = UIColor.white
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.borderColor = UIColor.black.cgColor
            
            cell.secondTeam.text = upComingEvents[indexPath.row].strAwayTeam
            cell.firstTeam.text = upComingEvents[indexPath.row].strHomeTeam
            cell.lbDate.text = upComingEvents[indexPath.row].dateEvent
            cell.lbTime.text = upComingEvents[indexPath.row].strTime
            return cell
        }
        
        
        if(collectionView == resultC){
            let resultCell = resultC.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! LatestResultCollectionViewCell
            resultCell.backgroundColor = UIColor.white
            resultCell.layer.borderWidth = 1
            resultCell.layer.cornerRadius = 20
            resultCell.layer.borderColor = UIColor.black.cgColor
            
            resultCell.secondTeam.text = lastEvents[indexPath.row].strAwayTeam
            resultCell.firstTeam.text = lastEvents[indexPath.row].strHomeTeam
            resultCell.firstTeamScore.text = lastEvents[indexPath.row].intHomeScore
            resultCell.secondTeamScore.text = lastEvents[indexPath.row].intAwayScore
            resultCell.dateForScore.text = lastEvents[indexPath.row].dateEvent
            resultCell.timeForScore.text = lastEvents[indexPath.row].strTime
            return resultCell
        }
        if(collectionView == teamsC){
            let teamsCell = teamsC.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
            teamsCell.teamsImg.layer.borderWidth = 0.5
            teamsCell.teamsImg.layer.masksToBounds = false
            teamsCell.teamsImg.layer.borderColor = UIColor.blue.cgColor
            teamsCell.teamsImg.layer.cornerRadius = teamsCell.teamsImg.frame.height/2
            teamsCell.teamsImg.clipsToBounds = true
            
            teamsCell.layer.borderWidth = 1
            teamsCell.layer.borderColor = UIColor.black.cgColor
            
            let url = URL(string: allTeams[indexPath.row].strTeamBadge)
            teamsCell.teamsImg.kf.setImage(with: url)
            return teamsCell
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == resultC){
            return CGSize(width: 400, height: 200)
        }
        if(collectionView == teamsC){
            return CGSize(width: 120, height: 120)
        }
        return CGSize(width: 300, height: 160)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == teamsC){
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let teamsDetailsVC = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            
            
            let details  = Details(name: allTeams[indexPath.row].strTeam,
                                   logoUrl: allTeams[indexPath.row].strTeamBadge,
                                   league: allTeams[indexPath.row].strLeague,
                                   stadiumName: allTeams[indexPath.row].strStadium,
                                   stadiumImgUrl: allTeams[indexPath.row].strStadiumThumb,
                                   country: allTeams[indexPath.row].strCountry,
                                   description: allTeams[indexPath.row].strDescriptionEN)
            teamsDetailsVC.detiales = details
            self.navigationController?.pushViewController(teamsDetailsVC, animated: true)
        }
    }
    
    func getLeagueName (leagueName:String)-> (String){
        var result = String()
        for char in leagueName{
            if char == " "{
                let temp :Character = "_"
                result.append(temp)
            }
            else{
                result.append(char)
            }
        }
        return result
    }
    
    func registerCollectionView(){
        self.teamsC.delegate = self
        self.teamsC.dataSource = self
        
        teamsC.register(UINib(nibName: "TeamsCollectionViewCell", bundle:    nil ), forCellWithReuseIdentifier: "teamsCell")
        
        self.eventC.delegate = self
        self.eventC.dataSource = self
        
        eventC.register(UINib(nibName: "UpcomingEventCollectionViewCell", bundle:    nil ), forCellWithReuseIdentifier: "cell")
        
        self.resultC.delegate = self
        self.resultC.dataSource = self
        
        resultC.register(UINib(nibName: "LatestResultCollectionViewCell", bundle:    nil ), forCellWithReuseIdentifier: "resultCell")
        
        
    }
    
    func fetchTeamsData (){
        NetworkService.fetchAllTeamsData(league: leagueName!,completion: { (result, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                self.allTeams = result?.teams ?? []
                DispatchQueue.main.async {
                    self.teamsC.reloadData()
                }
                
                
            }
            
        })
    }
    
    func fetchUpcaomingEventsData(){
        
        NetworkService.fetchUpComingEvent(id: leagueId!, round: "38", season: "2021-2022",completion: { (result, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                self.upComingEvents = result?.events ?? []
                DispatchQueue.main.async {
                    self.eventC.reloadData()
                }
                
                
            }
            
        })
    }
    
    func fetchLastResultsEvents (){
        NetworkService.fetchLastEvents(id: leagueId!, round: "35", season: "2021-2022",completion: { (result, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                self.lastEvents = result?.events ?? []
                DispatchQueue.main.async {
                    self.resultC.reloadData()
                }
                
                
            }
            
        })
        
    }
    
    func showNoInternetAlert(){
        let alert = UIAlertController(title: "There is NO Connection", message: "You should Connect to Network to get Data", preferredStyle: UIAlertController.Style.actionSheet)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    func setNavigationItem() {
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart"), style: .plain, target: self, action: #selector(addTapped))
        if  localDataSource.isFavorite(id: leagueId!){
            self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        else{
            self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
    
    
    @objc func addTapped() {
        
         
        if localDataSource.isFavorite(id: leagueId!){
            self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            do{
           try localDataSource.removeFromCoreData(id: leagueId!)
            }
            catch let error{
                print(error)
            }
        }else{
            self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            do{
                try localDataSource.saveLeagueToCoreData(leagueId: self.leagueId!, leagueName: self.leagueName!, leagueBadge: self.leagueBage!, leagueYoutube: self.leagueYoutube!)
                print("atsyvttttt")
            }catch let error{
                print(error)
            }
            
        }
        
        
        
    }
    
}
