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
        
        let birdsImages = ["bird1.png","bird3.png","bird4.png","bird5.png","bird6.png","bird7.png","bird8.png","bird9.png","bird10.png","bird11.png","bird13.png","bird12.png"]
        
        
        let birds = UIImageView(image: nil)
        birds.image = UIImage (named: birdsImages.randomElement()!)
        //birds.image = UIImage (named: "bird13.png")
        birds.frame = CGRect(x: W * 0.9, y: H * 0.02, width: W * 0.10, height: H * 0.15)
            
        
        let birds1 = UIImageView(image: nil)
        birds1.image = UIImage (named: birdsImages.randomElement()!)
        birds1.frame = CGRect(x: W * 0.9, y: H * 0.2, width: W * 0.10, height: H * 0.15)
        
        
        let birds2 = UIImageView(image: nil)
        birds2.image = UIImage (named: birdsImages.randomElement()!)
        birds2.frame = CGRect(x: W * 0.9, y: H * 0.4, width: W * 0.10, height: H * 0.15)
        
        let birds3 = UIImageView(image: nil)
        birds3.image = UIImage (named: birdsImages.randomElement()!)
        birds3.frame = CGRect(x: W * 0.9, y: H * 0.6, width: W * 0.10, height: H * 0.15)
        
        
        let birds4 = UIImageView(image: nil)
        birds4.image = UIImage (named: birdsImages.randomElement()!)
        birds4.frame = CGRect(x: W * 0.9, y: H * 0.8, width: W * 0.10, height: H * 0.15)
        
        birdImage.append(birds)
        self.view.addSubview(birds)
        self.view.bringSubviewToFront(birds)
        
        birdImage.append(birds1)
        self.view.addSubview(birds1)
        self.view.bringSubviewToFront(birds1)
        
        birdImage.append(birds2)
        self.view.addSubview(birds2)
        self.view.bringSubviewToFront(birds2)
        
        birdImage.append(birds3)
        self.view.addSubview(birds3)
        self.view.bringSubviewToFront(birds3)
        
        birdImage.append(birds4)
        self.view.addSubview(birds4)
        self.view.bringSubviewToFront(birds4)
        
        
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
        
        createBall.frame = CGRect(x:W * 0.10, y:H * 0.5, width : W * 0.07, height : H * 0.07)
        
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

