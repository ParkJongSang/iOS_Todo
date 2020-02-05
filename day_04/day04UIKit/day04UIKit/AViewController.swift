//
//  AViewController.swift
//  day04UIKit
//
//  Created by naver on 2020/02/05.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.backgroundColor = .blue

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print(self)
        print(self.view.window)
        print(self.view.window?.rootViewController)
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
