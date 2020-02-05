//
//  AViewController.swift
//  day04UIKit02
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue

        let presentBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let dismissBtn = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
//        print(self.presentingViewController)
//        print(self.presentedViewController) //자신이 띄워준 애가 없으니 nil
//        print(self.presentingViewController?.presentedViewController)
//        print(self)
        // Do any additional setup after loading the view.
        dismissBtn.setTitle("Dismiss", for: .normal)
        dismissBtn.addTarget(self, action: #selector(dismissClick(_:)), for: .touchUpInside)
        dismissBtn.backgroundColor = .red

        presentBtn.setTitle("Present", for: .normal)
        presentBtn.addTarget(self, action: #selector(presentClick(_:)), for: .touchUpInside)
        presentBtn.backgroundColor = .red

        self.view.addSubview(presentBtn)
        self.view.addSubview(dismissBtn)
    }

    @objc func dismissClick(_ sender:UIButton){
        dismiss(animated: true, completion: nil)
    }

    @objc func presentClick(_ sender:UIButton){
        let vc = BViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
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
