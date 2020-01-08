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
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    
    func birds() {
        
        let birdsImages = ["bird13.png","bird6.png","bird12.png"]
        
        let birds = UIImageView(image: nil)
        birds.image = UIImage (named: birdsImages.randomElement()!)
        birds.frame = CGRect(x: W * 0.9, y: H * 0.5, width: W * 0.10, height: H * 0.17)
        
        birdImage.append(birds)
        self.view.addSubview(birds)
        self.view.bringSubviewToFront(birds)
        
        birdsCollisionBehavior = UICollisionBehavior(items: birdImage)
        
        //
        
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
    var birdsCollisionBehavior: UICollisionBehavior!
    
    
    
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
        
        dynamicAnimator.addBehavior(birdsCollisionBehavior)
        //
  
    }
    
    
    
    @IBOutlet weak var ballImageView: DragImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        score = 0
        scoreLabel.text = String(score)
        
        birds()
        
        ballImageView.myDelegate = self
        
        boundaryCollisionBehavior = UICollisionBehavior(items: ballArray)
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Top_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 0.0), to: CGPoint (x: self.W * 1.0, y: self.H * 0.0))
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Left_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 0.0), to: CGPoint (x: self.W * 0.0, y: self.H * 1.0))
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Bottom_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 1.0), to: CGPoint (x: self.W * 1.0, y: self.H * 1.0))
        
        birdsCollisionBehavior = UICollisionBehavior(items:[])
        
        //bird collision
        birdsCollisionBehavior.action = {
            for createBall in self.ballArray{
                for bird in self.birdImage {
                    if createBall.frame.intersects(bird.frame){
               
                        let before = self.view.subviews.count
                        bird.removeFromSuperview()
                        let after = self.view.subviews.count

                        if before != after{
                        self.score += 1
                        self.scoreLabel.text = String(self.score)
                        }
                    }
                }
           }
        }
     
    }


}

