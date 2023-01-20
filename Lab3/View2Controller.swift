//
//  View2Controller.swift
//  Lab3
//
//  Created by Aleksandra Lewandowska on 20/01/2023.
//

import Foundation

import UIKit

class View2Controller: UIViewController {
    
    
    @IBOutlet var timeLabel: UILabel!
    var timer: Timer?
    
    var counterValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        let doubleGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        doubleGestureRecognizer.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(doubleGestureRecognizer)
        
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        
        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizerDown.direction = .right
        
        self.view.addGestureRecognizer(swipeGestureRecognizerDown)
        
        
    }
    
    func startTimer() -> Void {
        
        guard self.timer == nil else {
            return
        }
        
        self.timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
                                        
                                        #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    func endTimer() -> Void {
        guard let timer = timer else {
            return
        }
        timer.invalidate()
        self.timer = nil
    }
    
    @objc func handleTimer(){
        print("Funkcja wywoływana przez obiekt klasy Timer")
        self.counterValue += 1
        DispatchQueue.main.async {
            self.timeLabel.text = "\(self.counterValue)"
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        print("number of taps", sender.numberOfTouches)
        
        if sender.numberOfTouches == 1 {
            startTimer()
        } else if sender.numberOfTouches == 2 {
            endTimer()
        }
    }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        print("swipe right", sender)
        
        self.counterValue = 0
        DispatchQueue.main.async {
            self.timeLabel.text = "\(self.counterValue)"
        }
    }
    
}
