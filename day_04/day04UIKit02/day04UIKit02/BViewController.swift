//
//  BViewController.swift
//  day04UIKit02
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .green
        let dismissBtn = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        dismissBtn.setTitle("Dismiss", for: .normal)
        dismissBtn.addTarget(self, action: #selector(dismissClick(_:)), for: .touchUpInside)
        dismissBtn.backgroundColor = .red
        self.view.addSubview(dismissBtn)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);

        var res: UIResponder? = self

        while let responder = res{
            print(responder)
            res = responder.next
        }
    }

    @objc func dismissClick(_ sender:UIButton){
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
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
