//
//  AppColor.swift
//  Spotify-Replica
//
//  Created by Administrator on 19.11.22.
//

import Foundation
import UIKit

extension UIColor {
    static var appColors = AppColor()
}

class AppColor {
    var green = UIColor(named: "S-Green")
    var lightGray = UIColor(named: "L-Gray")
    var darkGray = UIColor(named: "D-Gray")
}
