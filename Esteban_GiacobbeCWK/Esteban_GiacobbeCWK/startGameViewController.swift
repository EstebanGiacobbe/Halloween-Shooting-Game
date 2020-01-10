//
//  startGameViewController.swift
//  Esteban_GiacobbeCWK
//
//  Created by jg17abg on 09/01/2020.
//  Copyright © 2020 jg17abg. All rights reserved.
//

import UIKit

class startGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var background = UIImageView(image: UIImage(named: "startBackground.png"))
        background.frame = UIScreen.main.bounds
        self.view.addSubview(background)
        self.view.sendSubviewToBack(background)
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
