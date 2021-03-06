//
//  LeaguesFaouriteTableViewController.swift
//  BeInClub
//
//  Created by Ahmed on 08/05/2022.
//

import UIKit
import CoreData
import Reachability

class LeaguesFaouriteTableViewController: UITableViewController {

    private var leagues = [FavLeagues]()
    var localSource : LocalSorce!
    
    var reachability = try! Reachability()

   

    override func viewDidLoad() {
        super.viewDidLoad()
        localSource = LocalSorce(appDelegete: UIApplication.shared.delegate as! AppDelegate)
     
    }

    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
        
        cell.leagueName.text = getLeagueName(leagueName:leagues[indexPath.row].leagueName)
        
        
        cell.leagueImage.sd_setImage(with: URL(string: leagues[indexPath.row].leaugeImaURL), placeholderImage: UIImage(named: "placeholder.png"))
                
        cell.leagueYoutube.isUserInteractionEnabled = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        reachability.whenReachable = { reachability in
            let leaguesDetailsController = LeagueDetailsViewController(nibName: "LeagueDetailsViewController", bundle: nil)
            leaguesDetailsController.leagueId = self.leagues[indexPath.row].leagueID
            leaguesDetailsController.leagueName = self.leagues[indexPath.row].leagueName
            self.navigationController?.pushViewController(leaguesDetailsController, animated: true)
            print("connected")
        }
        
        reachability.whenUnreachable = { _ in
            let alert = UIAlertController(title: "Network error", message: "There's no internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            print("not connected")
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
       
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            try! localSource.removeFromCoreData(id: leagues[indexPath.item].leagueID)
            leagues.remove(at: indexPath.item)
            fetchData()
            self.tableView.reloadData()
        }
    }

    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.tableView.bounds.minX, y: self.tableView.bounds.minY, width: self.tableView.bounds.size.width, height: self.tableView.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.tableView.backgroundView = emptyView
        self.tableView.separatorStyle = .none
    }
    
    func restore() {
        self.tableView.backgroundView = nil
        self.tableView.separatorStyle = .singleLine
    }
    
    func fetchData(){
        leagues.removeAll()
        leagues = localSource.fetchCoredate()
        reachability = try! Reachability()
        self.tableView.reloadData()
        if leagues.count == 0 {
            self.setEmptyView(title: "You don't have any favorite league saved yet.", message: "Your favorite leagues will be in here.")
            
        }else {
            self.restore()
            
        }
    }
    
    func getLeagueName (leagueName:String)-> (String){
        var result = String()
        for char in leagueName{
            if char == "_"{
                let temp :Character = " "
                result.append(temp)
            }
            else{
                result.append(char)
            }
        }
        return result
    }
    
}
