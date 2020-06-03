//
//  ViewController.swift
//  TrOver
//
//  Created by Bochkarov Valentyn on 22/05/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let playerStackView = PlayerStackView()
    let buttonsStackView = HomeBottomControlsStackView()
    
    let tracks = [
        Track(artistName: "ZHU", trackName: "In the Morning", imageName: "zhu"),
        Track(artistName: "Валик Индиго", trackName: "ЧП Любви", imageName: "ndgo")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupDummyCards()
    }
    
    fileprivate func setupDummyCards() {
        tracks.forEach { (track) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: track.imageName)
            cardView.artistNameLabel.text = track.artistName
            cardView.trackNameLabel.text = track.trackName
            cardsDeckView.addSubview(cardView)
            cardView.translatesAutoresizingMaskIntoConstraints = false
            cardView.heightAnchor.constraint(equalTo: topStackView.widthAnchor).isActive = true
            cardView.topAnchor.constraint(equalTo: topStackView.bottomAnchor).isActive = true
            cardView.leadingAnchor.constraint(equalTo: cardsDeckView.leadingAnchor).isActive = true
            cardView.bottomAnchor.constraint(equalTo: playerStackView.topAnchor).isActive = true
            cardView.trailingAnchor.constraint(equalTo: cardsDeckView.trailingAnchor).isActive = true
        } 
    }
    
    
    // MARK:- Fileprivate
    
    fileprivate func setupLayout() {
        
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, playerStackView, buttonsStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        overallStackView.topAnchor.constraint(equalTo:
            view.safeAreaLayoutGuide.topAnchor).isActive = true
        overallStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        overallStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        overallStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 8, bottom: 8, right: 8)
        
        overallStackView.bringSubviewToFront(cardsDeckView)
    }
    
    
}

