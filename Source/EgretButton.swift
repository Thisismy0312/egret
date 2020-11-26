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
    
    let stackView = UIStackView()
    let stackImage = UIImageView()
    
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
    
    private var radiuss: CGFloat = 4
    open var radius: CGFloat {
        get {
            return radiuss
        }
        set {
            radiuss = newValue
            self.layer.cornerRadius = radiuss
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
    
    private var isEnableds: Bool = true
    open var isEnabled: Bool {
        get {
            return isEnableds
        }
        
        set {
            isEnableds = newValue
            setColor()
        }
    }
    
    private var icons: UIImage?
    open var icon: UIImage? {
        get {
            return icons
        }
        
        set {
            if newValue == nil, icons != nil{
                stackView.removeArrangedSubview(stackImage)
            } else if icons == nil {
                stackView.insertArrangedSubview(stackImage, at: 0)
            } else if icons != nil {
                
            }
            
            icons = newValue
            stackImage.image = icons
            
            layoutIfNeeded()
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
        
        self.addSubview(stackView)
        
        stackImage.image = icons
        
        setStackView()
        
        titleLabel.textColor = titleColors
        titleLabel.text = "Egret"
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
        self.layer.cornerRadius = 5
        
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clicked)))
    }
    
    func setStackView() {
//        stackView.addArrangedSubview(stackImage)
        stackView.addArrangedSubview(titleLabel)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
    }
    
    func setColor() {
        gradientLayer.colors = isEnableds ? [colorHeads.cgColor, colorTails.cgColor] : [UIColor(hex: 0xB3B3B3).cgColor, UIColor(hex: 0xB3B3B3).cgColor]
        gradientLayer.startPoint = startPoints
        gradientLayer.endPoint = endPoints
    }

    func setConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        stackImage.translatesAutoresizingMaskIntoConstraints = false
        stackImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        stackImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
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
        guard isEnableds else { return }
        self.state = true
        self.alpha = 0.6
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard isEnableds else { return }
        if state {
            self.state = false
            self.alpha = 1
        }
        
        print("========cancel========")
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard isEnableds else { return }
        if state {
            self.alpha = 1
            state = false
        }
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension EgretButton {
    @objc func clicked() {
        guard isEnableds else { return }
        if let callback = backAction { callback() }
    }
}
