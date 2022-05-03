//
//  SportsCollectionViewController.swift
//  BeInClub
//
//  Created by Ahmed on 26/04/2022.
//

import UIKit
struct Movie{
    let photo:UIImage
    let tiltle:String
}
private let reuseIdentifier = "sportsCell"

class SportsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
    ,UICollectionViewDelegateFlowLayout
{
  
    
 
    
    //try
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        arrMovies.append(Movie(photo: UIImage(named: "football")!, tiltle: "Footballl"))
        arrMovies.append(Movie(photo: UIImage(named: "football")!, tiltle: "Footballl"))
        arrMovies.append(Movie(photo: UIImage(named: "football")!, tiltle: "Footballl"))
        arrMovies.append(Movie(photo: UIImage(named: "football")!, tiltle: "Footballl"))
        arrMovies.append(Movie(photo: UIImage(named: "football")!, tiltle: "Footballl"))
        arrMovies.append(Movie(photo: UIImage(named: "football")!, tiltle: "Footballl"))

       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMovies.count
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportsCell", for: indexPath) as! SportsCollectionViewCell
  
        cell.setupSportCell(photo: arrMovies[indexPath.row].photo, title: arrMovies[indexPath.row].tiltle)
//        cell.backgroundColor = UIColor.red
        return cell
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
