//
//  Font.swift
//  Fool
//
//  Created by Jiawei Li on 23/10/2019.
//  Copyright © 2019 Mauricio Cousillas. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    enum PingFangStyle: String {
        case bold = "KohinoorGujarati-Bold"
        case regular = "PingFangSC-Regular"
        case medium = "PingFangSC-Medium"
        case thin = "PingFangSC-Thin"
    }
    
    enum ArialStyle: String {
        case bold = "Arial-BoldMT"
        case regular = "ArialMT"
    }

    enum NewFontStyle: String {
        case bold = "KohinoorGujarati-Bold"
    }
    struct My {
        static func pingfang(_ size: Int, _ style: PingFangStyle = PingFangStyle.regular) -> UIFont {
            return UIFont(name: style.rawValue, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
        }
        
        static func arial(_ size: Int, _ style: ArialStyle = ArialStyle.regular) -> UIFont {
            return UIFont(name: style.rawValue, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
        }

        static func koh(_ size: Int, _ style: NewFontStyle = NewFontStyle.bold) -> UIFont {
            return UIFont(name: style.rawValue, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
        }
    }

}
