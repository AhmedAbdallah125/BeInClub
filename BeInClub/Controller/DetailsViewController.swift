//
//  DetailsViewController.swift
//  BeInClub
//
//  Created by Manny on 06/05/2022.
//

import UIKit

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

        detiales = Details(name: "Arsenal", logoUrl: "https://www.thesportsdb.com/images/media/team/badge/uyhbfe1612467038.png", league: "English Premier League", stadiumName: "Emirates Stadium", stadiumImgUrl: "https://www.thesportsdb.com/images/media/team/stadium/w1anwa1588432105.jpg", country: "England", description: "The Emirates Stadium (known as Ashburton Grove prior to sponsorship, and as Arsenal Stadium for UEFA competitions) is a football stadium in Holloway, London, England, and the home of Arsenal. With a capacity of 60,704 it is the fourth-largest football stadium in England after Wembley Stadium, Old Trafford and Tottenham Hotspur Stadium.\r\n\r\nIn 1997, Arsenal explored the possibility of relocating to a new stadium, having been denied planning permission by Islington Council to expand its home stadium, Highbury. After considering various options (including purchasing Wembley Stadium), the club bought an industrial and waste disposal estate in Ashburton Grove in 2000. A year later, they received the council's approval to build a stadium on the site; manager Arsène Wenger described this as the \"biggest decision in Arsenal's history\" since the board appointed Herbert Chapman. Relocation began in 2002, but financial difficulties delayed work until February 2004. Emirates was later announced as the main sponsor for the stadium. The entire stadium project was completed in 2006 at a cost of £390 million. The club's former stadium was redeveloped as Highbury Square, an apartment complex.\r\n\r\nThe stadium has undergone a process of \"Arsenalisation\" since 2009 with the aim of restoring Arsenal's heritage and history. The stadium has hosted international fixtures and music concerts.")
        
        teamName.text = detiales.name
        teamDes.text = detiales.description
        teamStaduim.text = detiales.stadiumName
        teamCountry.text = detiales.country
    }
    

}
