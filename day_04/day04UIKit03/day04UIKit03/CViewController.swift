//
//  CViewController.swift
//  day04UIKit03
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem = UITabBarItem(title: "C", image: nil, selectedImage: nil)
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue
        let btnA = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        btnA.addTarget(self, action: #selector(touchBtnA(_:)), for: .touchUpInside)
        btnA.backgroundColor = .green
        self.view.addSubview(btnA)
//        print(self.navigationController?.children)

        let btnB = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        btnB.addTarget(self, action: #selector(touchBtnB(_:)), for: .touchUpInside)
        btnB.backgroundColor = .white
        self.view.addSubview(btnB)
//        print(self.navigationController?.children)
    }

    @objc func touchBtnA(_ sender: UIButton){
        guard let vcB = self.navigationController?.children[1] else { return }
        self.navigationController?.popToViewController(vcB, animated: true)
    }

    @objc func touchBtnB(_ sender: UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
