//
//  startGameViewController.swift
//  Esteban_GiacobbeCWK
//
//  Created by jg17abg on 09/01/2020.
//  Copyright © 2020 jg17abg. All rights reserved.
//

import UIKit

class startGameViewController: UIViewController {
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    @IBOutlet weak var StartGame: UIButton!
    
    @IBOutlet weak var StartGame2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var background = UIImageView(image: UIImage(named: "startBackground.png"))
        background.frame = UIScreen.main.bounds
        self.view.addSubview(background)
        self.view.sendSubviewToBack(background)
        
        
        StartGame.frame = CGRect(x: W * 0.35 , y: H * 0.08, width: 174, height: 170)
        
        StartGame2.frame = CGRect(x: W * 0.35 , y: H * 0.5, width: 174, height: 170)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
