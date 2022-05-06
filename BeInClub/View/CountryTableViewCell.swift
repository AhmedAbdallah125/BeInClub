//
//  CountryTableViewCell.swift
//  BeInClub
//
//  Created by Ahmed on 06/05/2022.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryImage.layer.borderWidth = 1
        countryImage.layer.masksToBounds = false
        countryImage.layer.borderColor = UIColor.black.cgColor
        countryImage.layer.cornerRadius = countryImage.frame.height/2
        countryImage.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
    }

}
