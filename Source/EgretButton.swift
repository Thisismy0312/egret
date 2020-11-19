//
//  EgretButton.swift
//  Fool
//
//  Created by 徐文杰 on 2020/10/15.
//  Copyright © 2020 Free VPN Foundation. All rights reserved.
//

import UIKit

open class EgretButton: UIView {
    open var backAction: (() -> Void)?

    let titleLabel = UILabel()
    
    var state = false
    
    let gradientLayer = CAGradientLayer.init()
    
    private var titles: String = "nil"
    open var title: String {
        get {
            return titles
        }
        set {
            titles = newValue
            self.setLabel()
        }
    }
    
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
    
    private func setLabel() {
        titleLabel.text = titles
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setColor()
        
        self.layer.addSublayer(gradientLayer)
        self.layer.masksToBounds = true
        
        self.addSubview(titleLabel)
        
        titleLabel.textColor = titleColors
        titleLabel.text = "Egret"
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setLayout()
        self.layer.cornerRadius = 5
    }
    
    func setColor() {
        gradientLayer.colors = [colorHeads.cgColor, colorTails.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
//        self.layoutIfNeeded()
//        layoutSubviews()
    }

    func setLayout() {
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    open override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = self.bounds
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.state = true
        self.alpha = 0.6
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if state {
            self.state = false
            self.alpha = 1
        }
        
        print("========cancel========")
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if state {
            self.alpha = 1
            if let callback = backAction { callback() }
            state = false
        }
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
