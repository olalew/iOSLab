//
//  ViewController.swift
//  Lab3
//
//  Created by Aleksandra Lewandowska on 19/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var recognizer: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
    }


    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
         if let view = recognizer.view {
         view.center = CGPoint(x:view.center.x + translation.x,
         y:view.center.y + translation.y)}
         recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
}

