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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        let location = sender.location(in: view)
        
        if sender.state == .began {
            print ("begin")
            
        } else if sender.state == .changed {
            print ("changed")
            
        } else if sender.state == .ended {
            print ("ended")
            
        }

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
