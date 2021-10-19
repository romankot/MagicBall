//
//  ViewController.swift
//  MagicBall
//
//  Created by Roman Kot on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {

    
    let answers = ["Yes, definitely", "It is certain", "Without a doubt", "Yes", "Most likely", "Sure, why not?", "Same", "Tell me more", "Out to lunch", "Reply hazy, try again", "Ask again later", "The cake is a lie", "42", "TMI", "Very doubtful", "Don't count on it", "My reply is no", "Absolutely not"]
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var shakeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shakeButtonPressed(_ sender: UIButton){
        let randomIndex = Int.random(in: 0..<answers.count)
        print("Shake it like a polaroid picture!")
        answerLabel.text = answers[randomIndex]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        let randomIndex = Int.random(in: 0..<answers.count)
        answerLabel.text = answers[randomIndex]
    }

}

