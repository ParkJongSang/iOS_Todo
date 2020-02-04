//
//  ViewController.swift
//  day03Calculator
//
//  Created by naver on 2020/02/04.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//
import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let originX : CGFloat = 0.0
        let originY : CGFloat = 0.0
        self.view.backgroundColor = .white
        let calculator = Calculator(frame: CGRect(
            x: originX,
            y: originY,
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height
        ))

        self.view.addSubview(calculator)
    }

    func setUpDisplay(){

    }

    func setUpButton(){

    }

}
