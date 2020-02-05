//
//  BViewController.swift
//  day04UIKit03
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.tabBarItem = UITabBarItem(title: "B", image: nil, selectedImage: nil)
        // Do any additional setup after loading the view.
        let btnA = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        btnA.addTarget(self, action: #selector(touchBtnA(_:)), for: .touchUpInside)
        btnA.backgroundColor = .blue
        self.view.addSubview(btnA)

        let btnB = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        btnB.addTarget(self, action: #selector(touchBtnB(_:)), for: .touchUpInside)
        btnB.backgroundColor = .red
        self.view.addSubview(btnB)

        let leftBtn = UIBarButtonItem(title: "왼쪽", style: .plain, target: self, action: #selector(touchBtnB(_:)))
        self.navigationItem.leftBarButtonItem = leftBtn

        let rightBtn = UIBarButtonItem(title: "오른쪽", style: .plain, target: self, action: #selector(touchBtnB(_:)))
        self.navigationItem.rightBarButtonItem = rightBtn

        let button2 = UIBarButtonItem(title: "A", style: .plain, target: self, action: #selector(touchBackBtn))
        self.setToolbarItems([button2], animated: true)
    }

    @objc func touchBtnA(_ sender: UIButton){
        let vcC = CViewController()
        self.navigationController?.pushViewController(vcC, animated: true)
    }

    @objc func touchBtnB(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .all
    }

    override var shouldAutorotate: Bool{
        return true
    }

    @objc func touchBackBtn(_ sender: UIButton){

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
