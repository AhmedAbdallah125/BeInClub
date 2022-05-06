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
    
}
extension CountryChoiceViewController{
    func initCoutriesChoice(){
        countries.append(Country(countryName: "England", countryImage: "e"))
        countries.append(Country(countryName: "Spania", countryImage: "s"))
        countries.append(Country(countryName: "France", countryImage: "f"))

        
    }
}
