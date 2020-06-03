//
//  PlayerStackView.swift
//  TrOver
//
//  Created by Bochkarov Valentyn on 22/05/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit

class PlayerStackView: UIStackView {
    let slider = UISlider()
    let currentSecondsLabel = UILabel()
    let timeLeftLabel = UILabel()
    let leftPlayerTopEmptyLabel = UILabel()
    let rightPlayerTopEmptyLable = UILabel()
    let playlistsButton = UIButton(type: .system)
    let shareButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 130).isActive = true
        setupElements()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup StackView
extension PlayerStackView {
    
    func setupElements() {
        
        currentSecondsLabel.font = UIFont(name: "Teko-Regular", size: 14)
        currentSecondsLabel.textColor = #colorLiteral(red: 0.5647058824, green: 0.5647058824, blue: 0.5647058824, alpha: 1)
        currentSecondsLabel.text = "00:00"
        
        timeLeftLabel.font = UIFont(name: "Teko-Regular", size: 14)
        timeLeftLabel.textAlignment = .right
        timeLeftLabel.textColor = #colorLiteral(red: 0.5647058824, green: 0.5647058824, blue: 0.5647058824, alpha: 1)
        timeLeftLabel.text = "--:--"
        
        playlistsButton.setImage(#imageLiteral(resourceName: "Playlists").withRenderingMode(.alwaysOriginal), for: .normal)
        shareButton.setImage(#imageLiteral(resourceName: "Share").withRenderingMode(.alwaysOriginal), for: .normal)
        
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumbImage"), for: .normal)
        slider.minimumTrackTintColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        slider.maximumTrackTintColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8588235294, alpha: 1)
    }
}

// MARK: - Setup Constraints
extension PlayerStackView {
    func setupConstraints() {
     
        let labelsStackView = UIStackView(arrangedSubviews: [currentSecondsLabel, timeLeftLabel])
        labelsStackView.axis = .horizontal
        labelsStackView.spacing = 0
        
        let topSliderStackView = UIStackView(arrangedSubviews: [slider, labelsStackView])
        topSliderStackView.axis = .vertical
        topSliderStackView.spacing = 4
        
        let playerStackView = UIStackView(arrangedSubviews: [playlistsButton, topSliderStackView, shareButton])
        playerStackView.axis = .horizontal
        playerStackView.spacing = 16
        playerStackView.translatesAutoresizingMaskIntoConstraints = false
        
      
        addSubview(playerStackView)
        

        
        playlistsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        playlistsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        playlistsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        playlistsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        NSLayoutConstraint.activate([
            playerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            playerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            playerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
}
