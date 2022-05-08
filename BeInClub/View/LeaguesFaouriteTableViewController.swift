//
//  LeaguesFaouriteTableViewController.swift
//  BeInClub
//
//  Created by Ahmed on 08/05/2022.
//

import UIKit

class LeaguesFaouriteTableViewController: UITableViewController {

    private var leagues = [FavLeagues]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCoredate()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
        
        cell.leagueName.text = leagues[indexPath.row].leagueName
        
        
        cell.leagueImage.sd_setImage(with: URL(string: leagues[indexPath.row].leaugeImaURL), placeholderImage: UIImage(named: "placeholder.png"))
        
        
        cell.leagueYoutube.isUserInteractionEnabled = true
        //cell.leagueYoutube.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
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
    
    func fetchCoredate () {
        //TODO: Get data from DB
        if leagues.count == 0 {
            self.setEmptyView(title: "You don't have any favorite league saved yet.", message: "Your favorite leagues will be in here.")
        }else {
            self.restore()
        }
    }
    

}
