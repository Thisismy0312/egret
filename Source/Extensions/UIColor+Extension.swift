//
//  Color.swift
//  Fool
//
//  Created by Chris on 2019/9/6.
//  Copyright © 2019 Mauricio Cousillas. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    struct My {
        static var myGold: UIColor { return UIColor(red: 255.0 / 255.0, green: 212.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0) }
        static var text: UIColor { return UIColor(red: 51.0 / 255.0, green: 19.0 / 255.0, blue: 69.0 / 255.0, alpha: 1.0) }
        static var headerBGColor: UIColor { return UIColor(red: 23.0 / 255.0, green: 126.0 / 255.0, blue: 230.0 / 255.0, alpha: 1.0) }
        static var agreementFontColor: UIColor { return UIColor(red: 73.0 / 255.0, green: 170.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)}
        static var shadowColor: UIColor { return UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.1) }
        static var vipBackground: UIColor { return UIColor(red: 229.0 / 255.0, green: 229.0 / 255.0, blue: 229.0 / 255.0, alpha: 1) }
        static var flagBorderColor: UIColor { return UIColor(red: 31.0 / 255.0, green: 131.0 / 255.0, blue: 229.0 / 255.0, alpha: 1) }
        static var transparent: UIColor { return UIColor(white: 1, alpha: 0) }
        static var titlered: UIColor { return UIColor(red: 203.toColor, green: 20.toColor, blue: 20.toColor, alpha: 1) }
        static var contentgreen: UIColor { return UIColor(red: 23.toColor, green: 50.toColor, blue: 77.toColor, alpha: 1) }
        static var refusecolor: UIColor { return UIColor(hex: 0x455B71) }
        static var confirmcolor: UIColor { return UIColor(hex: 0x17324D) }
        
        static var gold1: UIColor { return UIColor(hex: 0xF8DD96) }
        static var gold2: UIColor { return UIColor(hex: 0xF5C468) }
        
        static var red1: UIColor { return UIColor(hex: 0xFB5257) }
        static var red2: UIColor { return UIColor(hex: 0xF42944) }
        
        static var blue1: UIColor { return UIColor(hex: 0x3576E1) }
        static var blue2: UIColor { return UIColor(hex: 0x234FCC) }
    }
}

extension UIColor {
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
}

extension Int {
    var flo: CGFloat {
        return CGFloat(self)
    }
    
    var toColor: CGFloat {
        return self.flo / 255.0
    }
}

