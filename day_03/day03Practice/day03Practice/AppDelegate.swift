//
//  AppDelegate.swift
//  day03Practice
//
//  Created by naver on 2020/02/04.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let window = UIWindow.init(frame: UIScreen.main.bounds)

        window.makeKeyAndVisible()
        self.window = window

        let viewController = ViewController.init()

        self.window?.rootViewController = viewController

        return true
    }



}

