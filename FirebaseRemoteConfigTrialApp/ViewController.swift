//
//  ViewController.swift
//  FirebaseRemoteConfigTrialApp
//
//  Created by Koray Yildiz on 29.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

  @IBOutlet weak var remoteLabel: UILabel!

  private let remoteConfigService: RCService = .shared

  override func viewDidLoad() {
    super.viewDidLoad()

    remoteConfigService.loadingDoneCallback = showRemoteValue
  }

  func showRemoteValue(){
    remoteLabel.text = remoteConfigService.string(forKey: "labelText")
  }
}


