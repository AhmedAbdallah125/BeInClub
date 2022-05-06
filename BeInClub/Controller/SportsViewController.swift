//
//  SportsCollectionViewController.swift
//  BeInClub
//
//  Created by Ahmed on 26/04/2022.
//

import UIKit
import Reachability
import Kingfisher

private let reuseIdentifier = "sportsCell"

class SportsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
,UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reachability = try! Reachability()
    var networkIndicator :UIActivityIndicatorView!
    var sportsArray:[Sport] = [Sport]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 10, y: 20, width: 50, height: 40))
          label.font = UIFont.boldSystemFont(ofSize: 24)

          label.text = "Sports"
          
          label.textAlignment = .center

          self.navigationItem.titleView = label
        
//        navigationController?.navigationBar.prefersLargeTitles = true


        //for indicator
        initActivityIndicator()
        title = "Sports"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //first
        networkIndicator.stopAnimating()
        reachability.whenReachable = { reachability in
            // connect and get data from api
            NetworkService.getAllSportsResponse{
                [weak self] (result) in
                self?.sportsArray = result?.sports ?? []
                self?.collectionView.reloadData()
            }
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
    func initActivityIndicator(){
        networkIndicator = UIActivityIndicatorView(style: .large)
        networkIndicator.center = view.center
        view.addSubview(networkIndicator)
        networkIndicator.startAnimating()
    }
    func showNoInternetAlert(){
        let alert = UIAlertController(title: "There is NO Connection", message: "You should Connect to Network to get Data", preferredStyle: UIAlertController.Style.actionSheet)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension SportsViewController{
    //for collection setting
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArray.count
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportsCell", for: indexPath) as! SportsCollectionViewCell
        //setData
        cell.sportImage.kf.setImage(
            with: URL(string: sportsArray[indexPath.row].strSportThumb),
            placeholder: UIImage(named: "sports"),
            options: [
                .cacheOriginalImage
            ]){result in}
        cell.sportLabel.text = sportsArray[indexPath.row].strSport
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleCellClicking(sportName: sportsArray[indexPath.row].strSport)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width * 0.49, height: view.frame.width * 0.45)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
}
extension SportsViewController{
    // handle cell clicking
    func handleCellClicking(sportName:String){
        let countryController = self.storyboard?.instantiateViewController(withIdentifier: "CountryChoiceViewController") as! CountryChoiceViewController
        countryController.sportName = sportName
        self.navigationController?.pushViewController(countryController, animated: true)
    }
}
