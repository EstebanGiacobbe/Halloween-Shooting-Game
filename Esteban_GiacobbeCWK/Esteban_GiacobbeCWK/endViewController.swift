//
//  endViewController.swift
//  Esteban_GiacobbeCWK
//
//  Created by jg17abg on 09/01/2020.
//  Copyright © 2020 jg17abg. All rights reserved.
//

import UIKit

class endViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var background = UIImageView(image: UIImage(named: "end1.png"))
        background.frame = UIScreen.main.bounds
        self.view.addSubview(background)
        self.view.sendSubviewToBack(background)
        
    }
    

    

}
