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
        heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        let subviews = [#imageLiteral(resourceName: "Like"), #imageLiteral(resourceName: "Dislike")].map { (img) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
                
        subviews.forEach { (v) in
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
