//
//  CanvasViewController.swift
//  CanvasApp
//
//  Created by Raquel Figueroa-Opperman on 3/12/18.
//  Copyright © 2018 RaquelFigueroa. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    @IBOutlet weak var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!
    
    let trayDownOffset: CGFloat! = 200
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!

    @IBOutlet weak var downArrow: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
        
    }
    
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
//        let location = sender.location(in: view)
        
        
        if sender.state == .began {
            trayOriginalCenter = trayView.center
            
        } else if sender.state == .changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if sender.state == .ended {
            if velocity.y > 0 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in self.trayView.center = self.trayDown}, completion: nil)
                downArrow.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi))
                
            } else {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in self.trayView.center = self.trayUp}, completion: nil)
                downArrow.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi*2))
            }
        }
    }
    
    @IBAction func didPanFace(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
//        let velocity = sender.velocity(in: view)
//        let location = sender.location(in: view)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(sender:)))
        
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(didDoubleTap(sender:)))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        
        let rotateGestureRecognizer = UIRotationGestureRecognizer(target: self, action:#selector(didRotate(sender:)))

        
        if sender.state == .began {
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            
            newlyCreatedFace.isUserInteractionEnabled = true
            newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            newlyCreatedFace.addGestureRecognizer(pinchGestureRecognizer)
            newlyCreatedFace.addGestureRecognizer(doubleTapGestureRecognizer)
            newlyCreatedFace.addGestureRecognizer(rotateGestureRecognizer)
            
        } else if sender.state == .changed {
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
        } else if sender.state == .ended {

        }
    }
    
    @objc func didPan(sender: UIPanGestureRecognizer) {
//        let location = sender.location(in: view)
//        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            newlyCreatedFace = sender.view as! UIImageView
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center

        } else if sender.state == .changed {
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
        } else if sender.state == .ended {

        }
    }
    
    @objc func didPinch(sender: UIPinchGestureRecognizer) {
        
        let imageView = sender.view as! UIImageView
        
        if sender.state == .began {
            
        } else if sender.state == .changed {
            let scale = sender.scale
            imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            imageView.transform = imageView.transform.scaledBy(x: scale, y: scale)
            
        } else if sender.state == .ended {
            sender.scale = 1
        }
    }
    
    @objc func didDoubleTap(sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        imageView.removeFromSuperview()
    }
    
    @objc func didRotate(sender: UIRotationGestureRecognizer) {
      let imageView = sender.view as! UIImageView
        
        if sender.state == .began {
            
        } else if sender.state == .changed {
            let rotation = sender.rotation
            imageView.transform = CGAffineTransform(rotationAngle: rotation)
            
        } else if sender.state == .ended {
            sender.rotation = 0
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
