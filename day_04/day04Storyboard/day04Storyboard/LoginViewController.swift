//
//  LoginViewController.swift
//  day04Storyboard
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginBtn: UIButton!

    @IBAction func login(_ sender: Any) {
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "TabbarController")
//
//        present(viewController, animated: true, completion: nil)
//
//        let storyboard = UIStoryboard.init(name: "Second", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "Second")
//        present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        loginBtn.backgroundColor = .white
        loginBtn.layer.cornerRadius = 28
        loginBtn.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        loginBtn.layer.borderWidth = 2
    }
    
}
