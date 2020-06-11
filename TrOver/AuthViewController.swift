//
//  AuthViewController.swift
//  TrOver
//
//  Created by Bochkarov Valentyn on 07/06/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit
import StoreKit

class AuthViewController: UIViewController {
    /// The instance of `SKCloudServiceController` that will be used for querying the available `SKCloudServiceCapability` and Storefront Identifier.
    let cloudServiceController = SKCloudServiceController()
    
    /// The instance of `AppleMusicManager` that will be used for querying storefront information and user token.
    var appleMusicManager: AppleMusicManager!
    
    /// The instance of `AuthorizationManager` used for querying and requesting authorization status.
    var authorizationManager: AuthorizationManager!
    
    /// The current set of `SKCloudServiceCapability` that the sample can currently use.
    var cloudServiceCapabilities = SKCloudServiceCapability()
    
    /// The current set of two letter country code associated with the currently authenticated iTunes Store account.
    var cloudServiceStorefrontCountryCode = ""
    
    /// The Music User Token associated with the currently signed in iTunes Store account.
    var userToken = ""
    
    let authButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        setupConstraints()
        authButton.addTarget(self, action: #selector(authButtonPressed), for: .touchUpInside)
    }
    
    @objc func authButtonPressed() {
        requestUserToken()
        print(userToken)
//     authorizationManager.requestCloudServiceAuthorization()
//
//     authorizationManager.requestMediaLibraryAuthorization()
    }
}


// MARK: - Setup Elements
extension AuthViewController {
    func setupElements() {
        view.backgroundColor = .systemBackground
        authButton.backgroundColor = .systemGreen
        authButton.setTitleColor(.white, for: .normal)
        authButton.setTitle("Login with Spotify", for: .normal)
    }
}

// MARK: - Setup Constraints
extension AuthViewController {
    func setupConstraints() {
        view.addSubview(authButton)
        authButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
          ])
    }
}
extension AuthViewController {
func requestUserToken() {
    let developerToken = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjZHWU1KSzc0RzMifQ.eyJpc3MiOiJWR0FTTUROVVg0IiwiaWF0IjoxNTkxNTQ4MDk0LCJleHAiOjE1OTE1OTEyOTR9.EVwV1J_38tS_ZeTKTpgCgpoIgEG1Jt4d2G45PnTGOXAaV-xulsRXvMX26oSphnCvqix0_swQx-ufPWGDFuVaTw"

    
    if SKCloudServiceController.authorizationStatus() == .authorized {
        
        let completionHandler: (String?, Error?) -> Void = { [weak self] (token, error) in
            guard error == nil else {
                print("An error occurred when requesting user token: \(error!.localizedDescription)")
                return
            }
            
            guard let token = token else {
                print("Unexpected value from SKCloudServiceController for user token.")
                return
            }
            
            self?.userToken = token
            print(token)
            
            /// Store the Music User Token for future use in your application.
            let userDefaults = UserDefaults.standard
            
            userDefaults.set(token, forKey: AuthorizationManager.userTokenUserDefaultsKey)
            userDefaults.synchronize()
            
//            if self?.cloudServiceStorefrontCountryCode == "" {
//                self?.requestStorefrontCountryCode()
//            }
            
            NotificationCenter.default.post(name: AuthorizationManager.cloudServiceDidUpdateNotification, object: nil)
        }
        
        if #available(iOS 11.0, *) {
            cloudServiceController.requestUserToken(forDeveloperToken: developerToken, completionHandler: completionHandler)
        } else {
            cloudServiceController.requestPersonalizationToken(forClientToken: developerToken, withCompletionHandler: completionHandler)
        }
    }
}
}
