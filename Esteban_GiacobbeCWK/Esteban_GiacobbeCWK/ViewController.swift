//
//  ViewController.swift
//  Esteban_GiacobbeCWK
//
//  Created by jg17abg on 07/01/2020.
//  Copyright © 2020 jg17abg. All rights reserved.
//

import UIKit

protocol subviewDelegate{
    func createBall()
    
}


class ViewController: UIViewController, subviewDelegate {
    
    func createBall() {
        
        var ballImageView = UIImageview(image: nil)
        
        ballImageView.image = UIImage(named: "ball.png")
        
        ballImageView.frame = CGRect(x:100, y:100, width : 30, height : 50)
        
        self.view.addSubview(ballImageView)
        
        
        
    }
    
    
    //@IBOutlet weak var ballView: DragImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //ballImageView.myDelegate = self
        
        
    }


}

