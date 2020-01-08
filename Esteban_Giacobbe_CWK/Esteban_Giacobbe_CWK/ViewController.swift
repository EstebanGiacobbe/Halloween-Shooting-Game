//
//  ViewController.swift
//  Esteban_Giacobbe_CWK
//
//  Created by jg17abg on 08/01/2020.
//  Copyright © 2020 jg17abg. All rights reserved.
//

import UIKit

protocol subViewDelegate{
    func createBall()
    func aimLocation(dx: CGFloat, dy: CGFloat, center: CGPoint)
}

var angleX : CGFloat!
var angleY: CGFloat!
var pointRelease: CGPoint!



class ViewController: UIViewController, subViewDelegate {
    
    func aimLocation(dx: CGFloat, dy: CGFloat, center: CGPoint) {
        angleX = dx
        angleY = dy
        pointRelease = center
    }

    
    var dynamicAnimator : UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    

    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    var ballArray:[UIImageView] = []
    
    
    func createBall(){
        
        let createBall = UIImageView(image: nil)
        createBall.image = UIImage (named: "ball.png")
        createBall.frame = CGRect(x: W * 0.10, y: H * 0.5, width: W * 0.10, height: H * 0.17)
        self.view.addSubview(createBall)
        self.view.bringSubviewToFront(createBall)
        self.ballArray.append(createBall)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehavior = UIDynamicItemBehavior(items: ballArray)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        dynamicItemBehavior.addItem(createBall)
        dynamicItemBehavior.addLinearVelocity(CGPoint(x: angleX * 2, y: angleY * 2), for: createBall)
        
        
        
        
    }
    
    
    @IBOutlet weak var Shooter: DragImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      Shooter.createBallDelegate = self
        
        
        
    }


}

