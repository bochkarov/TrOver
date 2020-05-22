//
//  PlayerStackView.swift
//  TrOver
//
//  Created by Bochkarov Valentyn on 22/05/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit

class PlayerStackView: UIStackView {
    let artistNameLabel = UILabel()
    let trackNameLabel = UILabel()
    let slider = UISlider()
    let currentSecondsLabel = UILabel()
    let timeLeftLabel = UILabel()
    let playlistsButton = UIButton(type: .system)
    let shareButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup StackView
extension PlayerStackView {
    
    func setupElements() {
        artistNameLabel.font = UIFont(name: "Teko", size: 17)
        artistNameLabel.textAlignment = .center
        artistNameLabel.textColor = #colorLiteral(red: 0.7058823529, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        artistNameLabel.text = "David Penn"
        
        trackNameLabel.font = UIFont(name: "Montserrat", size: 26)
        trackNameLabel.textAlignment = .center
        trackNameLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        trackNameLabel.text = "House Masters"
        
        currentSecondsLabel.font = UIFont(name: "Teko", size: 14)
        currentSecondsLabel.textColor = #colorLiteral(red: 0.5647058824, green: 0.5647058824, blue: 0.5647058824, alpha: 1)
        currentSecondsLabel.text = "00:00"
        
        timeLeftLabel.font = UIFont(name: "Teko", size: 14)
        timeLeftLabel.textAlignment = .right
        timeLeftLabel.textColor = #colorLiteral(red: 0.5647058824, green: 0.5647058824, blue: 0.5647058824, alpha: 1)
        timeLeftLabel.text = "--:--"
        
        playlistsButton.setImage(#imageLiteral(resourceName: "Playlists"), for: .normal)
        shareButton.setImage(#imageLiteral(resourceName: "Share"), for: .normal)
        
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumbImage"), for: .normal)
        slider.minimumTrackTintColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        slider.maximumTrackTintColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8588235294, alpha: 1)
    }
}

// MARK: - Setup Constraints
extension PlayerStackView {
    func setupConstraints() {
        let trackInfoStackView = UIStackView(arrangedSubviews: [artistNameLabel, trackNameLabel])
        trackInfoStackView.axis = .vertical
        trackInfoStackView.spacing = 4
        
        
    }
}
