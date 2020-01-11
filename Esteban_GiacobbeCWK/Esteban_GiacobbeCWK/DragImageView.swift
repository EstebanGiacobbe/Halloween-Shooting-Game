//
//  DragImageView.swift
//  Esteban_GiacobbeCWK
//
//  Created by jg17abg on 07/01/2020.
//  Copyright © 2020 jg17abg. All rights reserved.
//

import UIKit

class DragImageView: UIImageView {

    var myDelegate: subviewDelegate?

    
    
    var startLocation: CGPoint?
    var currentLocation: CGPoint?
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startLocation = touches.first?.location(in: self)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         currentLocation = touches.first?.location(in: self)
        
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        var newCenter = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
    
        
        //constrain movement to a square
        
        let halfx = self.bounds.midX
        newCenter.x = max(halfx, newCenter.x)
        newCenter.x = min(W * 0.15 - halfx, newCenter.x)
        
        let halfy = self.bounds.midY
        newCenter.y = max(H / 2 - W * 0.15 / 2 + halfy, newCenter.y)
        newCenter.y = min(H / 2 + W * 0.15 / 2 - halfy, newCenter.y)
        
        
        self.center = newCenter
        
        self.myDelegate?.aimLocation(dx: dx * 10, dy: dy * 10, center: self.center)
       
}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.center = CGPoint(x: W * 0.05, y: H * 0.5)
        
        self.myDelegate?.createBall()
       
       
        
    }
    
}
