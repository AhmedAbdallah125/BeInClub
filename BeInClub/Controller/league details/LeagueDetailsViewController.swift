//
//  LeagueDetailsViewController.swift
//  BeInClub
//
//  Created by AbdElrahman sayed on 02/05/2022.
//

import UIKit

 class LeagueDetailsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
     @IBOutlet weak var eventC: UICollectionView!
     @IBOutlet weak var teamsC: UICollectionView!
     
     @IBOutlet weak var resultC: UICollectionView!
     override func viewDidLoad() {
        super.viewDidLoad()
        self.teamsC.delegate = self
        self.teamsC.dataSource = self
         
         teamsC.register(UINib(nibName: "TeamsCollectionViewCell", bundle:    nil ), forCellWithReuseIdentifier: "teamsCell")
         
        self.eventC.delegate = self
        self.eventC.dataSource = self

         eventC.register(UINib(nibName: "UpcomingEventCollectionViewCell", bundle:    nil ), forCellWithReuseIdentifier: "cell")
         
        self.resultC.delegate = self
        self.resultC.dataSource = self
         
         resultC.register(UINib(nibName: "LatestResultCollectionViewCell", bundle:    nil ), forCellWithReuseIdentifier: "resultCell")
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == resultC{
            return 5
        }
        if collectionView == teamsC{
            return 8
        }
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventC.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpcomingEventCollectionViewCell

        cell.backgroundColor = UIColor.white
        cell.secondTeam.text = "Manchester United"
        cell.firstTeam.text = "Al Ahly"

        if(collectionView == resultC){
            let resultCell = resultC.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! LatestResultCollectionViewCell
            resultCell.backgroundColor = UIColor.white
            resultCell.secondTeam.text = "liverpool"
            resultCell.firstTeam.text = "Al Ahly"
            return resultCell
        }
        if(collectionView == teamsC){
            let teamsCell = teamsC.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
            teamsCell.teamsImg.layer.borderWidth = 0.5
            teamsCell.teamsImg.layer.masksToBounds = false
            teamsCell.teamsImg.layer.borderColor = UIColor.blue.cgColor
            teamsCell.teamsImg.layer.cornerRadius = teamsCell.teamsImg.frame.height/2
            teamsCell.teamsImg.clipsToBounds = true



            teamsCell.teamsImg.image = UIImage(named: "prim")
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
}
