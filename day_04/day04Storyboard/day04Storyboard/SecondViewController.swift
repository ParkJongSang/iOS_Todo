//
//  SecondViewController.swift
//  day04Storyboard
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func dismiss(_ sender: UIButton) {
//        dismiss(dismiss(animated: true, completion: nil))
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
