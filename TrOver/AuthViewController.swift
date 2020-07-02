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
    let SpotifyClientID = SpotifyConstants.CLIENT_ID
    let SpotifyRedirectURL = URL(string: SpotifyConstants.REDIRECT_URI)!

    lazy var configuration = SPTConfiguration(
      clientID: SpotifyClientID,
      redirectURL: SpotifyRedirectURL
    )
    

    
    let authButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        setupConstraints()
        authButton.addTarget(self, action: #selector(authButtonPressed), for: .touchUpInside)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
      let parameters = appRemote.authorizationParameters(from: url);

            if let access_token = parameters?[SPTAppRemoteAccessTokenKey] {
                appRemote.connectionParameters.accessToken = access_token
                self.accessToken = access_token
            } else if let error_description = parameters?[SPTAppRemoteErrorDescriptionKey] {
                // Show the error
            }
      return true
    }
    
    @objc func authButtonPressed() {

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

