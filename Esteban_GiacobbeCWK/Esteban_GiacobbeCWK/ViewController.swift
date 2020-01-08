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
    func aimLocation(dx: CGFloat, dy: CGFloat, center: CGPoint)
    
    func birds()
    
}

var angleX: CGFloat!
var angleY: CGFloat!
var pointRelease: CGPoint!


class ViewController: UIViewController, subviewDelegate {
    func birds() {
        
        let birds = UIImageView(image: nil)
        birds.image = UIImage (named: "bird12.png")
        birds.frame = CGRect(x: W * 0.9, y: H * 0.5, width: W * 0.10, height: H * 0.17)
        
        birdImage.append(birds)
        self.view.addSubview(birds)
        self.view.bringSubviewToFront(birds)
        
    }
    
    
    func aimLocation(dx:CGFloat, dy: CGFloat, center: CGPoint){
        
        angleX = dx
        angleY = dy
        pointRelease = center
        
    }
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    var ballArray:[UIImageView] = []
    var birdImage:[UIImageView] = []
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var boundaryCollisionBehavior: UICollisionBehavior!
    
    
    
    func createBall() {
        
        let createBall = UIImageView(image: nil)
        
        createBall.image = UIImage(named: "ball.png")
        
        createBall.frame = CGRect(x:W * 0.10, y:H * 0.5, width : W * 0.10, height : H * 0.17)
        
        self.view.addSubview(createBall)
        self.view.bringSubviewToFront(createBall)
        self.ballArray.append(createBall)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehavior = UIDynamicItemBehavior(items: ballArray)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        dynamicItemBehavior.addItem(createBall)
        dynamicItemBehavior.addLinearVelocity(CGPoint(x: angleX * 2, y: angleY * 2), for: createBall)
        
        boundaryCollisionBehavior.addItem(createBall)
        dynamicAnimator.addBehavior(boundaryCollisionBehavior)
        
        
           
        
    }
    
    
    @IBOutlet weak var ballImageView: DragImageView!
    //@IBOutlet weak var ballView: DragImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        birds()
        
        ballImageView.myDelegate = self
        
        boundaryCollisionBehavior = UICollisionBehavior(items: ballArray)
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Top_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 0.0), to: CGPoint (x: self.W * 1.0, y: self.H * 0.0))
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Left_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 0.0), to: CGPoint (x: self.W * 0.0, y: self.H * 1.0))
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Bottom_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 1.0), to: CGPoint (x: self.W * 1.0, y: self.H * 1.0))
        
    }


}

