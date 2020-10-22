//
//  File.swift
//  Fool
//
//  Created by Jiawei Li on 22/10/2019.
//  Copyright © 2019 Mauricio Cousillas. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGColor
    }
    func round(corners: UIRectCorner, radius: CGFloat) {
        _ = drawRound(corners: corners, radius: radius)
    }
    func round(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let mask = drawRound(corners: corners, radius: radius)
        addBorder(mask: mask, borderColor: borderColor, borderWidth: borderWidth)
    }
    func fullyRound(diameter: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = diameter / 2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor;
    }
    func removeAllSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    var originX: CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            self.frame = CGRect(x: newValue, y: originY, width: vWidth, height: vHeight)
        }
    }
    
    var originY: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            self.frame = CGRect(x: originX, y: newValue, width: vWidth, height: vHeight)
        }
    }
    
    var vWidth: CGFloat {
        get {
            return self.frame.width
        }
        
        set {
            self.frame = CGRect(x: originX, y: originY, width: newValue, height: vHeight)
        }
    }
    
    var vHeight: CGFloat {
        get {
            return self.frame.height
        }
        
        set {
            self.frame = CGRect(x: originX, y: originY, width: vWidth, height: newValue)
        }
    }
    
    var bottom: CGFloat {
        return originY + vHeight
    }
    
    var top: CGFloat {
        return originY
    }
    
    var right: CGFloat {
        return originX + vWidth
    }
    
    var left: CGFloat {
        return originX
    }
}

private extension UIView {
    @discardableResult func drawRound(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        return mask
    }
    func addBorder(mask: CAShapeLayer, borderColor: UIColor, borderWidth: CGFloat) {
        let borderLayer = CAShapeLayer()
        borderLayer.path = mask.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }
}
