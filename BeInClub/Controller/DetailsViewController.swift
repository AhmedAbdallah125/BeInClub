//
//  DetailsViewController.swift
//  BeInClub
//
//  Created by Manny on 06/05/2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    var detiales : Details!
    @IBOutlet weak var stadiumImgCover: UIImageView!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamCountry: UILabel!
    @IBOutlet weak var teamStaduim: UILabel!
    @IBOutlet weak var teamLeague: UILabel!
    @IBOutlet weak var teamDes: UILabel!
    @IBOutlet weak var teamName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage(imageView: teamLogo, url: detiales.logoUrl)
        setImage(imageView: stadiumImgCover, url: detiales.stadiumImgUrl)
        teamName.text = detiales.name
        teamDes.text = detiales.description
        teamStaduim.text = detiales.stadiumName
        teamCountry.text = detiales.country
        
    }
    
    func setImage (imageView : UIImageView, url : String) {
        let url = URL(string: url)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "1"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
}
