//
//  SettingViewController.swift
//  MagicBall
//
//  Created by Roman Kot on 19.10.2021.
//

import UIKit

class SettingViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = UserDefaults.standard.string(forKey: "answers")
    }
    
    @IBAction func saveAnswersButton() {
        UserDefaults.standard.set(textView.text, forKey: "answers")
        NotificationCenter.default.post(name: Notification.Name("answers"), object: textView.text)
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}
