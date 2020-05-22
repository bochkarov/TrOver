//
//  TopNavigationStackView.swift
//  TrOver
//
//  Created by Bochkarov Valentyn on 22/05/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//

import UIKit

class TopNavigationStackView: UIStackView {
    
    let logoImage = UIImageView(image: #imageLiteral(resourceName: "Trackovery"))
    let settingsButtons = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        distribution = .equalCentering
        logoImage.contentMode = .center
        settingsButtons.setImage(#imageLiteral(resourceName: "Settings").withRenderingMode(.alwaysOriginal), for: .normal)
        
        [logoImage, settingsButtons].forEach { (v) in
            addArrangedSubview(v)
            
        isLayoutMarginsRelativeArrangement = true
            layoutMargins = .init(top: 0, left: 32, bottom: 0, right: 32)
        }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
