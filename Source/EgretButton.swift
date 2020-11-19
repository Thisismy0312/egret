//
//  EgretButton.swift
//  Fool
//
//  Created by 徐文杰 on 2020/10/15.
//  Copyright © 2020 Free VPN Foundation. All rights reserved.
//

import UIKit

open class EgretButton: UIView {
    var backAction: (() -> Void)?

    let title = UILabel()
    
    var state = false
    
    let gradientLayer = CAGradientLayer.init()
    
    private var strs: String = "nil"
    var str: String {
        get {
            return strs
        }
        set {
            strs = newValue
            self.setLabel()
        }
    }
    
    private var fonts: UIFont = UIFont.My.pingfang(12, .medium)
    var font: UIFont {
        get {
            return fonts
        }
        
        set {
            fonts = newValue
            title.font = fonts
        }
    }
    
    private func setLabel() {
        title.text = strs
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gradientLayer.colors = [UIColor.My.gold1.cgColor, UIColor.My.gold2.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
        
        self.layer.addSublayer(gradientLayer)
        self.layer.masksToBounds = true
        
        self.addSubview(title)
        
        title.textColor = UIColor(hex: 0xAD6E26)
        title.text = "Egret"
        title.textAlignment = .center
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        setLayout()
        self.layer.cornerRadius = 5
    }

    func setLayout() {
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
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
