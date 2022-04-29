//
//  upcomingEventCollectionView.swift
//  BeInClub
//
//  Created by AbdElrahman sayed on 26/04/2022.
//

import UIKit

class upcomingEventCollectionView: UICollectionView , UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UpcomingEventCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpcomingEventCollectionViewCell
        cell.secondTeam.text = "Manchester United"
        cell.firstTeam.text = "Al Ahly"
        return cell
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
