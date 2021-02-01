//
//  ViewController.swift
//  AuthenticationTestApp
//
//  Created by 吉田周平 on 2021/02/01.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var startAuthButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startAuthButtonTapped(_ sender: Any) {
        let context = LAContext()
        let reason = "This app uses Touch ID / Facd ID to secure your data."
        var authError: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, error) in
                if success {
                    self.setResultLabel(message: "認証成功")
                } else {
                    self.setResultLabel(message: "認証失敗")
                }
            }
        } else {
            setResultLabel(message: "認証できない")
        }
    }
    
    func setResultLabel(message: String) {
        DispatchQueue.main.sync {
            resultLabel.text = message
        }
        
    }
}

