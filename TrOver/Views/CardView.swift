//
//  CardView.swift
//  TrOver
//
//  Created by Bochkarov Valentyn on 24/05/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "zhu"))
    let artistNameLabel = UILabel()
    let trackNameLabel = UILabel()
    fileprivate let threshold: CGFloat = 100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupElements()
        setupConstraints()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        // rotation
        // convert degrees to radians
        
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        let rotationalTransformation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransformation
        self.transform = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        // determine dismiss card or not

        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseOut,
                       animations: {
                        if shouldDismissCard {
    //                            self.frame = CGRect(x: 0,
    //                                                y: 0,
    //                                                width: self.frame.width,
    //                                                height: self.frame.height)
                            self.center = CGPoint(x: 600 * translationDirection, y: 0)
                        } else {
                            self.transform = .identity
                        }
        }) { (_) in
            self.transform = .identity
            if shouldDismissCard {
                self.removeFromSuperview()
            }
            
//            self.frame = CGRect(x: 0,
//                                y: 0,
//                                width: self.superview!.frame.width,
//                                height: self.superview!.frame.height)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK:- Setup View
extension CardView {
    func setupElements() {
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        artistNameLabel.font = UIFont(name: "Teko-Regular", size: 17)
        artistNameLabel.textAlignment = .center
        artistNameLabel.textColor = #colorLiteral(red: 0.7058823529, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        artistNameLabel.text = "ZHU"
        
        trackNameLabel.font = UIFont(name: "Montserrat-Medium", size: 26)
        trackNameLabel.textAlignment = .center
        trackNameLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        trackNameLabel.text = "In the Morning"
    }
}
// MARK: - Setup Constraints
extension CardView {
    func setupConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(artistNameLabel)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        artistNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(trackNameLabel)
        trackNameLabel.translatesAutoresizingMaskIntoConstraints = false
        trackNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 8).isActive = true
        trackNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}

