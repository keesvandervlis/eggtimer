//
//  ViewController.swift
//  egg timer
//
//  Created by Kees van der vlis on 29/04/2017.
//  Copyright © 2017 Kees van der vlis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var startTijd = 300
    
    func updatetimerViewLabel ( nieuweTijd :Int) {
        let nieuweTijd = nieuweTijd
        timerViewLabel.text = String(nieuweTijd)
    }

    func processTimer() {
        if startTijd >= 1 {
            startTijd = startTijd - 1
            updatetimerViewLabel(nieuweTijd: startTijd)
        }
    }
    
    @IBAction func playPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func minusTenPressed(_ sender: Any) {
        if startTijd > 10 {
            startTijd = startTijd - 10
            updatetimerViewLabel(nieuweTijd: startTijd)
        }
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        startTijd = 300
        updatetimerViewLabel(nieuweTijd: startTijd)
    }
    
    @IBAction func plusTenPressed(_ sender: Any) {
        startTijd = startTijd + 10
        updatetimerViewLabel(nieuweTijd: startTijd)
    }
    
    @IBOutlet weak var timerViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
            updatetimerViewLabel(nieuweTijd: startTijd)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

