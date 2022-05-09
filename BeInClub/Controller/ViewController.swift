//
//  ViewController.swift
//  BeInClub
//
//  Created by Ahmed on 26/04/2022.
//

import UIKit
import Lottie
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = AnimationView()
                animationView.animation = Animation.named("launchAnimation")
                animationView.contentMode = .scaleAspectFit
                animationView.frame = view.bounds
                animationView.loopMode = .loop
               
                animationView.play()
                view.addSubview(animationView)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
                    guard let self = self else {return}
                    self.performSegue(withIdentifier: "launchScreen", sender: self)
                }
        // Do any additional setup after loading the view.
    }


}

