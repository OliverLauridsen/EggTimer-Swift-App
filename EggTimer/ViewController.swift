//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var eggTimes: [String: Int] = [
        "Soft": 10,
        "Medium": 20,
        "Hard": 30
    ]
    

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        var timeLeft = self.eggTimes[hardness]!
        let totalTime = Float(timeLeft)
        var timePassed = Float(0)
        
       Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if timeLeft > 0 {
                timeLeft -= 1
                timePassed += 1
                let percentageProgress = timePassed / totalTime
                
                self.progressBar.progress = Float(percentageProgress)
                self.timerLabel.text = "Your egg is done is done in \(timeLeft )"
            } else {
                Timer.invalidate()
                self.timerLabel.text = "DONE!"
            }
        }
    }
}
