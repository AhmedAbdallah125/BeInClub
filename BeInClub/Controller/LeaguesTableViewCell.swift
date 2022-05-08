//
//  LeaguesTableViewCell.swift
//  BeInClub
//
//  Created by Mohamed Hosam on 01/05/2022.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueName: UILabel!
    
    @IBOutlet weak var leagueYoutube: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
