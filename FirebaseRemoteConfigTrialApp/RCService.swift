//
//  RCValues.swift
//  FirebaseRemoteConfigTrialApp
//
//  Created by Koray Yildiz on 29.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Firebase

class RCService {

  static let shared = RCService()

  var loadingDoneCallback: (() -> Void)?
  var fetchComplete = false

  private let remoteConfig: RemoteConfig

  private init() {
    remoteConfig = RemoteConfig.remoteConfig()
    loadDefaultValues()
    fetchCloudValues()
  }

  private func loadDefaultValues() {
    remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
  }

  private func fetchCloudValues() {
    remoteConfig.fetchAndActivate { (status, error) in
      if let error = error {
        print("Error:\(error.localizedDescription)")
        return
      }

      if status == .successFetchedFromRemote {
        self.fetchComplete = true
        self.loadingDoneCallback?()
      }
    }
  }

  public func string(forKey key: String) -> String {
    return remoteConfig.configValue(forKey: key).stringValue ?? ""
  }
}
