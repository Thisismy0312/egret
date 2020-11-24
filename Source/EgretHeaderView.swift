//
//  EgretHeaderView.swift
//  Egret
//
//  Created by Linti on 2020/11/24.
//

import UIKit

class EgretHeaderView: UIView {
    
    let titleView = UIView()
    let titleLabel = UILabel()
    
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
    
    private var fonts: UIFont = UIFont.My.pingfang(18, .medium)
    open var font: UIFont {
        get {
            return fonts
        }
        
        set {
            fonts = newValue
            titleLabel.font = fonts
        }
    }
    
    private var colorHeads: UIColor = UIColor.My.red1
    open var colorHead: UIColor {
        get {
            return colorHeads
        }
        set {
            colorHeads = newValue
            setColor()
        }
    }
    
    private var colorTails: UIColor = UIColor.My.red2
    open var colorTail: UIColor {
        get {
            return colorTails
        }
        set {
            colorTails = newValue
            setColor()
        }
    }
    
    private var titleColors: UIColor = UIColor(hex: 0xFFFFFF)
    open var titleColor: UIColor {
        get {
            return titleColors
        }
        
        set {
            titleColors = newValue
            titleLabel.textColor = titleColors
        }
    }
    
    private var startPoints: CGPoint = CGPoint.init(x: 1, y: 0)
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
        
        setColor()
        
        self.layer.addSublayer(gradientLayer)
        self.layer.masksToBounds = true
        
        addSubview(titleView)
        titleView.addSubview(titleLabel)
        
        titleView.backgroundColor = .green
        
        titleLabel.text = title
        titleLabel.font = font
        titleLabel.textColor = titleColor
        
        setConstraints()
    }
    
    private func setLabel() {
        titleLabel.text = titles
    }
    
    func setConstraints() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
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
