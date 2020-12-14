//
//  EgretRadioButton.swift
//  Fool
//
//  Created by 徐文杰 on 2020/10/12.
//  Copyright © 2020 Free VPN Foundation. All rights reserved.
//

import UIKit

open class EgretRadioButton: UIView {
    private let iconCheck = UIImageView()
    private let titleLabel = UILabel()
    
    open var index = 0
    private var groups: String = "defaultGroup"
    open var group: String {
        get {
            return groups
        }
        
        set {
            groups = newValue
        }
    }
    
    private var enableds: Bool = true
    open var enabled: Bool {
        get {
            return enableds
        }
        
        set {
            enableds = newValue
            self.alpha = newValue ? 1 : 0.5
            self.isUserInteractionEnabled = newValue
        }
    }
    
    private var unCheckedIcons: UIImage?
    open var unCheckedIcon: UIImage? {
        get {
            return unCheckedIcons
        }
        
        set {
            unCheckedIcons = newValue
            iconCheck.image = checked ? checkedIcons : unCheckedIcons
        }
    }
    
    private var checkedIcons: UIImage?
    open var checkedIcon: UIImage? {
        get {
            return checkedIcons
        }
        
        set {
            checkedIcons = newValue
            iconCheck.image = checked ? checkedIcons : unCheckedIcons
        }
    }
    
    open var title: String? {
        get {
            return titleLabel.text
        }
        
        set {
            titleLabel.text = newValue
        }
    }
    
    open var titleColor: UIColor {
        get {
            return titleLabel.textColor
        }
        
        set {
            titleLabel.textColor = newValue
        }
    }
    
    open var titleFont: UIFont {
        get {
            return titleLabel.font
        }
        
        set {
            titleLabel.font = newValue
        }
    }
    
    private var values: String = "defaultValue"
    open var value: String {
        get {
            return values
        }
        
        set {
            values = newValue
        }
    }
    
    private var state: Bool = false
    open var checked: Bool {
        get {
            return state
        }
        
        set {
            state = newValue
            iconCheck.image = newValue ? checkedIcon : unCheckedIcon
            
            if newValue {
                EgretDatas.radioButtonData[groups] = value
                if let action = selectedAction { action() }
            }
        }
    }
    
    open var selectedAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconCheck)
        addSubview(titleLabel)
        
        iconCheck.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        iconCheck.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        iconCheck.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        iconCheck.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        iconCheck.widthAnchor.constraint(equalTo: iconCheck.heightAnchor).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: iconCheck.trailingAnchor, constant: 10).isActive = true
        
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeState)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(radioClick(_:)), name: NSNotification.Name(rawValue: "radioClick"), object: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EgretRadioButton {
    
    @objc func radioClick(_ notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let groupname = dict["group"] as? String, let buttonindex = dict["index"] as? Int {
                if groupname == group {
                    checked = buttonindex == index
                }
            }
        }
    }
    
    @objc func changeState() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "radioClick"), object: nil, userInfo: ["group": group, "index": index])
    }
}
