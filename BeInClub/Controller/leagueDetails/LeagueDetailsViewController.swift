//
//  LeagueDetailsViewController.swift
//  BeInClub
//
//  Created by AbdElrahman sayed on 26/04/2022.
//

import UIKit

class LeagueDetailsViewController: UIViewController  ,UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var teamsCV: UICollectionView!
    @IBOutlet weak var eventCV: UICollectionView!
    @IBOutlet weak var resultCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == resultCV{
            return 5
        }
        if collectionView == teamsCV{
            return 8
        }
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventCV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpcomingEventCollectionViewCell
        
        cell.backgroundColor = UIColor.white
        cell.secondTeam.text = "Manchester United"
        cell.firstTeam.text = "Al Ahly"
        
        if(collectionView == resultCV){
            let resultCell = resultCV.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! LatestResultCollectionViewCell
            resultCell.backgroundColor = UIColor.white
            resultCell.secondTeam.text = "liverpool"
            resultCell.firstTeam.text = "Al Ahly"
            return resultCell
        }
        if(collectionView == teamsCV){
            let teamsCell = teamsCV.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
            teamsCell.teamsImg.layer.borderWidth = 0.5
            teamsCell.teamsImg.layer.masksToBounds = false
            teamsCell.teamsImg.layer.borderColor = UIColor.blue.cgColor
            teamsCell.teamsImg.layer.cornerRadius = teamsCell.teamsImg.frame.height/2
            teamsCell.teamsImg.clipsToBounds = true
            
            
            
            teamsCell.teamsImg.image = UIImage(named: "1")
            return teamsCell
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == resultCV){
            return CGSize(width: 400, height: 200)
        }
        if(collectionView == teamsCV){
            return CGSize(width: 120, height: 120)
        }
        return CGSize(width: 300, height: 162)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
