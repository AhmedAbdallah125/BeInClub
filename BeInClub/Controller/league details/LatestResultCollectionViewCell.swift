//
//  LatestResultCollectionViewCell.swift
//  BeInClub
//
//  Created by AbdElrahman sayed on 03/05/2022.
//

import UIKit

class LatestResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var secondTeam: UILabel!
         @IBOutlet weak var firstTeam: UILabel!
         @IBOutlet weak var secondTeamScore: UILabel!

         @IBOutlet weak var firstTeamScore: UILabel!
         @IBOutlet weak var timeForScore: UILabel!
         @IBOutlet weak var dateForScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
