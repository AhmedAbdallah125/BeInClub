//
//  SportsCollectionViewCell.swift
//  BeInClub
//
//  Created by Ahmed on 26/04/2022.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportLabel: UILabel!
    func setupSportCell(photo:UIImage,title:String){
        sportImage.image = photo
        sportLabel.text = title
    }
}
