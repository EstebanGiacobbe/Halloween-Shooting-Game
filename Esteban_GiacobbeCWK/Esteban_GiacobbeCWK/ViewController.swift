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
        
        let createBall = UIImageView(image: nil)
        
        createBall.image = UIImage(named: "ball.png")
        
        createBall.frame = CGRect(x:100, y:100, width : 30, height : 50)
        
        self.view.addSubview(createBall)
        
        
        
    }
    
    
    @IBOutlet weak var ballImageView: DragImageView!
    //@IBOutlet weak var ballView: DragImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ballImageView.myDelegate = self
        
        
    }


}

