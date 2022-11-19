//
//  AppImages.swift
//  UIKit-Programatically
//
//  Created by Administrator on 19.11.22.
//

import Foundation
import UIKit

extension UIImage {
    static var appImages = AppImages()
}

class AppImages {
    
    var spotifyIconImage = UIImage(named: "spotify-icon")
    var getStartedBGImage = UIImage(named: "get-started-bg")
    var chooseModeImage = UIImage(named: "choose-mode-bg")
    var lightModeImage = UIImage(named: "light-mode")
    var darkModeImage = UIImage(named: "dark-mode")
}
