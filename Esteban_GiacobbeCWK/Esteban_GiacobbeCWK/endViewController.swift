//
//  endViewController.swift
//  Esteban_GiacobbeCWK
//
//  Created by jg17abg on 09/01/2020.
//  Copyright © 2020 jg17abg. All rights reserved.
//

import UIKit

class endViewController: UIViewController {
    
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    @IBOutlet weak var scoreInformation: UILabel!
    
    var scoreInfo: String!
    
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var background = UIImageView(image: UIImage(named: "end1.png"))
        background.frame = UIScreen.main.bounds
        self.view.addSubview(background)
        self.view.sendSubviewToBack(background)
        
        scoreInformation.text = scoreInfo
        
         restartButton.frame = CGRect(x: W * 0.2 , y: H * 0.3, width: 174, height: 170)
        
         homeButton.frame = CGRect(x: W * 0.5 , y: H * 0.3, width: 174, height: 170)    }
    

    

}
