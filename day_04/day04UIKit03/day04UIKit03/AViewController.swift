//
//  ViewController.swift
//  day04UIKit03
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.backgroundColor = .red

//        self.title = "A로 가자"

        self.navigationItem.title = "A 뷰 ㅋㅋㅋㅋ"
        self.navigationItem.prompt = "프로모션 텍스트"
        self.tabBarItem = UITabBarItem(title: "A", image: nil, selectedImage: nil)

        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        customView.backgroundColor = .red

        self.navigationItem.titleView = customView
        
        let backBtn = UIBarButtonItem(title: "A로 가자", style: .plain, target: self, action: #selector(touchBackBtn(_:)))
        self.navigationItem.backBarButtonItem = backBtn

        let btn = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        btn.addTarget(self, action: #selector(touchBtn(_:)), for: .touchUpInside)
        btn.backgroundColor = .green
        self.view.addSubview(btn)

        let button2 = UIBarButtonItem(title: "A", style: .plain, target: self, action: #selector(touchBackBtn))
        self.setToolbarItems([button2], animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let vcB = BViewController()
//        self.navigationController?.pushViewController(vcB, animated: true)
    }

    @objc func touchBtn(_ sender: UIButton){
        let vcB = BViewController()
        self.navigationController?.pushViewController(vcB, animated: true)
    }

    @objc func touchBackBtn(_ sender: UIButton){

    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }

    override var shouldAutorotate: Bool{
        return true
    }

}
