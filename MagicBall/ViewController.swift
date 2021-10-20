//
//  ViewController.swift
//  MagicBall
//
//  Created by Roman Kot on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var answers = ["Yes, definitely", "It is certain", "Without a doubt", "Yes"]
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var shakeButton: UIButton!
    var webAnswer = "No Answers yet"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("answers"), object: nil)
    }
    
    @objc func didGetNotification(_ notification: Notification) {
        let text = (notification.object as! String?)!
        // use text to generate answer
        print("received answers  = \n" + text)
        answers = text.components(separatedBy: .newlines)
    }
    
    @IBAction func shakeButtonPressed(_ sender: UIButton){
        getStaticAnswer()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        generateAnswer()
    }

    func generateAnswer() {
        
        answerLabel.text = webAnswer
    }
    
    func getStaticAnswer() {
        let randomIndex = Int.random(in: 0..<answers.count)
        answerLabel.text = answers[randomIndex]
    }

    @IBAction func settingPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "setting_vc") else { return }
        present(vc, animated: true)
    }
    
}

