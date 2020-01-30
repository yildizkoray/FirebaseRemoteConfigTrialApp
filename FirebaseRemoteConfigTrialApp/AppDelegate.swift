//
//  AppDelegate.swift
//  FirebaseRemoteConfigTrialApp
//
//  Created by Koray Yildiz on 29.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    FirebaseApp.configure()
    let _ = RCService.shared
    return true
  }
}

