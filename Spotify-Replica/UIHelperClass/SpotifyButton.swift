//
//  SpotifyButton.swift
//  Spotify-Replica
//
//  Created by Administrator on 19.11.22.
//

import Foundation
import UIKit

class SpotifyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = UIColor.appColors.green
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
    }
}
