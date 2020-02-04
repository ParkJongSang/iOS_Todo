//
//  ViewController.swift
//  day03Practice
//
//  Created by naver on 2020/02/04.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //        let rectTrio_1 = RectView(x:0, y:0, width:100, height:200)
    //        let rectTrio_2 = RectView(x:0, y:0, width:130, height:150)
    var rectTrio_3 = RectView(x:0, y:0, width:180, height:200)
    var plusButton = UIButton(frame: CGRect(x: 200, y: 100, width: 100, height: 75))
    var minusButton = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 75))

    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        plusButton.backgroundColor = .red
        minusButton.backgroundColor = .blue

        plusButton.addTarget(self, action: #selector(self.sizeUp(_:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(self.sizeDown(_:)), for: .touchUpInside)

//        rectTrio_1.center = CGPoint(x: 100, y: 200)
//        rectTrio_2.center = CGPoint(x: 200, y: 400)
        rectTrio_3.center = CGPoint(x: 300, y: 600)

//        self.view.addSubview(rectTrio_1)
//        self.view.addSubview(rectTrio_2)
        self.view.addSubview(rectTrio_3)
        self.view.addSubview(plusButton)
        self.view.addSubview(minusButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // App이 메모리구조 경고를 받으면 호출
    }

    @objc func sizeUp(_ Sender:UIButton){
        var curSize = rectTrio_3.frame.size
        curSize.height += 15
        curSize.width += 15
        rectTrio_3.frame.size = curSize

    }

    @objc func sizeDown(_ Sender:UIButton){
        var curSize = rectTrio_3.frame.size
        curSize.height -= 15
        curSize.width -= 15
        rectTrio_3.frame.size = curSize
    }
}

class RectView : UIView{
    var height:Int
    var width:Int

    override init(frame: CGRect) {
        self.height = 0
        self.width = 0
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        self.height = 0
        self.width = 0
        fatalError("init(coder:) has not been implemented")
    }

    init(x:Int, y:Int, width:Int, height:Int){
        self.height = height
        self.width = width
        super.init(frame:CGRect(x: x, y: y, width: width, height: height))
        let mid = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width-20, height: self.frame.size.height-20))
        let sml = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width-40, height: self.frame.size.height-40))

        self.backgroundColor = .red
        mid.backgroundColor = .blue
        sml.backgroundColor = .white

        sml.center = mid.center
        mid.center = self.center

        self.addSubview(mid)
        mid.addSubview(sml)

    }

    override func layoutSubviews() {
        let mid = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width-20, height: self.frame.size.height-20))
        let sml = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width-40, height: self.frame.size.height-40))

        self.backgroundColor = .brown
        mid.backgroundColor = .blue
        sml.backgroundColor = .white

        sml.center = mid.center
        mid.center = self.center

        self.addSubview(mid)
        mid.addSubview(sml)
    }
}

