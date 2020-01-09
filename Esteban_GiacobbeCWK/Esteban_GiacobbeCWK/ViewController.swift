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
    
    
}

var angleX: CGFloat!
var angleY: CGFloat!
var pointRelease: CGPoint!


class ViewController: UIViewController, subviewDelegate {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    var ballArray:[UIImageView] = []
    var birdImage:[UIImageView] = []
    var birdrepeat:[UIImageView] = []
    
    var gameTime = 20
    var gameTimer = Timer()
    
    
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var boundaryCollisionBehavior: UICollisionBehavior!
    var birdsCollisionBehavior: UICollisionBehavior!
    
    
    func birds() {
        
        let birdsImages = ["Golem.png","Golem1.png","Golem3.png","Golem4.png"]
        
        
        
            
        Timer.scheduledTimer(withTimeInterval: 1, repeats:true){ timer in
            
        let index = Int.random(in: 0 ... 3)
            if !self.birdrepeat.contains(self.birdImage[index]){
                self.birdrepeat.append(self.birdImage[index])
                self.view.addSubview(self.birdImage[index])
            }
            
        }

        let birds = UIImageView(image: nil)
        birds.image = UIImage (named: birdsImages.randomElement()!)
        //birds.image = UIImage (named: "bird13.png")
        birds.frame = CGRect(x: self.W * 0.9, y: self.H * 0.02, width: 80, height: 80)
            
        birdImage.append(birds)        //self.view.addSubview(birds)
        //self.view.bringSubviewToFront(birds)
        
        let birds1 = UIImageView(image: nil)
        birds1.image = UIImage (named: birdsImages.randomElement()!)
        birds1.frame = CGRect(x: self.W * 0.9, y: self.H * 0.3, width: 80, height: 80)
        
        
        let birds2 = UIImageView(image: nil)
        birds2.image = UIImage (named: birdsImages.randomElement()!)
        birds2.frame = CGRect(x: self.W * 0.9, y: self.H * 0.5, width: 80, height: 80)
        
        let birds3 = UIImageView(image: nil)
        birds3.image = UIImage (named: birdsImages.randomElement()!)
        birds3.frame = CGRect(x: self.W * 0.9, y: self.H * 0.8, width: 80, height: 80)
        
        
        
        
       birdImage.append(birds1)
        //self.view.addSubview(birds1)
        //self.view.bringSubviewToFront(birds1)
        
        birdImage.append(birds2)
        //self.view.addSubview(birds2)
        //self.view.bringSubviewToFront(birds2)
        
        birdImage.append(birds3)
        //self.view.addSubview(birds3)
        //self.view.bringSubviewToFront(birds3)
        
        
        birdsCollisionBehavior = UICollisionBehavior(items: birdImage)
        
        //
        
    }

    func aimLocation(dx:CGFloat, dy: CGFloat, center: CGPoint){
        
        angleX = dx
        angleY = dy
        pointRelease = center
        
    }

    
    func createBall() {
        
        let createBall = UIImageView(image: nil)
        
        createBall.image = UIImage(named: "PumpkinPNG.png")
        
        createBall.frame = CGRect(x:W * 0.10, y:H * 0.5, width : 30, height : 30)
        
        self.view.addSubview(createBall)
        self.view.bringSubviewToFront(createBall)
        self.ballArray.append(createBall)
        
        dynamicItemBehavior = UIDynamicItemBehavior(items: ballArray)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        //dynamicItemBehavior.addItem(createBall)
        self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: angleX, y: angleY), for: createBall)
        
        boundaryCollisionBehavior.addItem(createBall)
        dynamicAnimator.addBehavior(boundaryCollisionBehavior)
        
        dynamicAnimator.addBehavior(birdsCollisionBehavior)
    }

    @IBOutlet weak var ballImageView: DragImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var background = UIImageView(image: UIImage(named: "Background.png"))
        background.frame = UIScreen.main.bounds
        self.view.addSubview(background)
        self.view.sendSubviewToBack(background)
        
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        score = 0
        scoreLabel.text = String(score)
        
        birds()
        
        ballImageView.myDelegate = self

        collision()
        
        gameTime = 20
        
       gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.finishGameTimer), userInfo: nil, repeats: true)
        
        
    }
        
        func collision() {
        
        boundaryCollisionBehavior = UICollisionBehavior(items: ballArray)
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Top_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 0.0), to: CGPoint (x: self.W * 1.0, y: self.H * 0.0))
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Left_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 0.0), to: CGPoint (x: self.W * 0.0, y: self.H * 1.0))
        
        boundaryCollisionBehavior.addBoundary(withIdentifier: "Bottom_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 1.0), to: CGPoint (x: self.W * 1.0, y: self.H * 1.0))
        
        birdsCollisionBehavior = UICollisionBehavior(items:[])
        
        //bird collision
        birdsCollisionBehavior.action = {
            for createBall in self.ballArray{
                for bird in self.birdrepeat {
                    if createBall.frame.intersects(bird.frame){
                        
                        let index = self.birdrepeat.firstIndex(of: bird)
                        self.birdrepeat.remove(at: index!)
                        
                        
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
    
    @objc func finishGameTimer(){
        
        gameTime -= 1
        timeLabel.text = String(gameTime)
        
        if gameTime == 0{
            
            gameTimer.invalidate()
            
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.end), userInfo: nil, repeats: false)
        }
        
    }
    
    @objc func end (){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "endGame") as! endViewController
        
        self.present(vc, animated: false, completion: nil)
        
        
    }

}

