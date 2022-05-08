//
//  CountryChoiceViewController.swift
//  BeInClub
//
//  Created by Ahmed on 06/05/2022.
//

struct Country{
    var countryName:String
    var countryImage:String
}
import UIKit

class CountryChoiceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //instance member will be set after navigate to screen
    var sportName :String!
    var countries = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initCoutriesChoice()
    }
    
    
    
}
extension CountryChoiceViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryTableViewCell
       
        
        cell.countryImage.layer.borderWidth = 1
        cell.countryImage.layer.masksToBounds = false
        cell.countryImage.layer.borderColor = UIColor.black.cgColor
        cell.countryImage.layer.cornerRadius = cell.countryImage.frame.height/2
        cell.imageView?.image = UIImage(named: countries[indexPath.row].countryImage)
        
        cell.countryName.text =  countries[indexPath.row].countryName
        // will handle clicking
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToLeaguesView(countryName: countries[indexPath.row].countryName)
    }
    
}
extension CountryChoiceViewController{
    
    func initCoutriesChoice(){
        countries.append(Country(countryName: "England", countryImage: "gb"))
        countries.append(Country(countryName: "Spain", countryImage: "es"))
        countries.append(Country(countryName: "France", countryImage: "fr"))
    }
    
    func navigateToLeaguesView(countryName:String){
        let leaguesController = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        leaguesController.sportName = sportName
        leaguesController.countryName = countryName
        self.navigationController?.pushViewController(leaguesController, animated: true)
    }
    
}
