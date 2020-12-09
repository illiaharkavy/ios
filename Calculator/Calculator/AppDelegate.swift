//
//  AppDelegate.swift
//  Calculator
//
//  Created by LIUBOU KOZUS on 9/3/20.
//  Copyright © 2020 LIUBOU KOZUS. All rights reserved.
//

import UIKit
import MathParser

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(try! "2²".evaluate())
        return true
    }
}

