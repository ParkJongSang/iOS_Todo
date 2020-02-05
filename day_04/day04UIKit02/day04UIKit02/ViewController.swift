//
//  ViewController.swift
//  day04UIKit02
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        btn.setTitle("BUTTON", for: .normal)
        btn.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        btn.backgroundColor = .black
        btn.center = self.view.center
        
        self.view.backgroundColor = .white
        self.view.addSubview(btn)
    }

    @objc func click(_ sender:UIButton){
        let aViewController = AViewController()
        present(aViewController, animated: true, completion: nil)
    }

}

