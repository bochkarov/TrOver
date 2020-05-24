//
//  HomeBottomControlsStackView.swift
//  TrOver
//
//  Created by Bochkarov Valentyn on 22/05/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        let subviews = [#imageLiteral(resourceName: "Like"), #imageLiteral(resourceName: "Dislike")].map { (img) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = true
            
//            button.widthAnchor.constraint(equalToConstant: 82).isActive = true
//        
//            button.heightAnchor.constraint(equalToConstant: 83).isActive = true
        
            return button
        }
                
        subviews.forEach { (v) in
            addArrangedSubview(v)
            isLayoutMarginsRelativeArrangement = true
                layoutMargins = .init(top: 0, left: 24, bottom: 0, right: 24)
            
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
