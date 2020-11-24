//
//  EgretHeaderView.swift
//  Egret
//
//  Created by Linti on 2020/11/24.
//

import UIKit

class EgretHeaderView: UIView {
    
    var safeAreaTop: CGFloat = 20
    let titleView = UIView()
    let titleLabel = UILabel()
    
    let gradientLayer = CAGradientLayer.init()
    
    private var fonts: UIFont = UIFont.My.pingfang(12, .medium)
    open var font: UIFont {
        get {
            return fonts
        }
        
        set {
            fonts = newValue
            titleLabel.font = fonts
        }
    }
    
    private var colorHeads: UIColor = UIColor.My.gold1
    open var colorHead: UIColor {
        get {
            return colorHeads
        }
        set {
            colorHeads = newValue
            setColor()
        }
    }
    
    private var colorTails: UIColor = UIColor.My.gold1
    open var colorTail: UIColor {
        get {
            return colorTails
        }
        set {
            colorTails = newValue
            setColor()
        }
    }
    
    private var titleColors: UIColor = UIColor(hex: 0xAD6E26)
    open var titleColor: UIColor {
        get {
            return titleColors
        }
        
        set {
            titleColors = newValue
            titleLabel.textColor = titleColors
        }
    }
    
    private var startPoints: CGPoint = CGPoint.init(x: 0, y: 1)
    open var startPoint: CGPoint {
        get {
            return startPoints
        }
        
        set {
            startPoints = newValue
            setColor()
        }
    }
    
    private var endPoints: CGPoint = CGPoint.init(x: 1, y: 1)
    open var endPoint: CGPoint {
        get {
            return endPoints
        }
        
        set {
            endPoints = newValue
            setColor()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                safeAreaTop = window.safeAreaInsets.top
            }
        }
        
        setColor()
        
        self.layer.addSublayer(gradientLayer)
        self.layer.masksToBounds = true
        
        addSubview(titleView)
        titleView.addSubview(titleLabel)
    }
    
    func setColor() {
        gradientLayer.colors = [colorHeads.cgColor, colorTails.cgColor]
        gradientLayer.startPoint = startPoints
        gradientLayer.endPoint = endPoints
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    open override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
