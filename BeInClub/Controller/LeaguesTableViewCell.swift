//
//  LeaguesTableViewCell.swift
//  BeInClub
//
//  Created by Mohamed Hosam on 28/04/2022.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var imgLeague: UIImageView!
    
    @IBOutlet weak var lblLeagueName: UILabel!
    
    
    @IBOutlet weak var imgYoutube: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
