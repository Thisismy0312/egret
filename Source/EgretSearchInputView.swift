//
//  EgretSearchInputView.swift
//  Egret
//
//  Created by Linti on 2020/12/4.
//

import UIKit

public protocol SearchDelegate {
    func returnAction(_ textField: UITextField)
}

open class EgretSearchInputView: UIView {
    
    private let searchIcon = UIImageView()
    private let contentInput = UITextField()
    open var delegate: SearchDelegate?
    
    private var borderColors: UIColor = UIColor(hex: 0xCCCCCC)
    open var borderColor: UIColor {
        get {
            return borderColors
        }
        
        set {
            borderColors = newValue
            self.layer.borderColor = borderColors.cgColor
        }
    }
    
    private var borderWidths: CGFloat = 1
    open var borderWidth: CGFloat {
        get {
            return borderWidths
        }
        
        set {
            borderWidths = newValue
            self.layer.borderWidth = borderWidths
        }
    }
    
    private var icons: UIImage? = UIImage(named: "icon_Search", in: Resources.bundle, compatibleWith: nil)
    open var icon: UIImage? {
        get {
            return icons
        }
        
        set {
            icons = newValue
            searchIcon.image = icons
        }
    }
    
    open var keyboardType: UIKeyboardType {
        get {
            return contentInput.keyboardType
        }
        
        set {
            contentInput.keyboardType = newValue
        }
    }
    
    private var placeHolders: String = "搜索"
    open var placeHolder: String {
        get {
            return placeHolders
        }
        
        set {
            placeHolders = newValue
            contentInput.attributedPlaceholder = NSAttributedString(string: placeHolders, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColors])
        }
    }
    
    private var placeHolderColors: UIColor = UIColor(hex: 0xCCCCCC)
    open var placeHolderColor: UIColor {
        get {
            return placeHolderColors
        }
        
        set {
            placeHolderColors = newValue
            contentInput.attributedPlaceholder = NSAttributedString(string: placeHolders, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColors])
        }
    }
    
    private var textColors: UIColor = UIColor.black
    open var textColor: UIColor {
        get {
            return textColors
        }
        
        set {
            textColors = newValue
            contentInput.textColor = textColors
        }
    }
    
    private var clearButtonModes: UITextField.ViewMode = .whileEditing
    open var clearButtonMode: UITextField.ViewMode {
        get {
            return clearButtonModes
        }
        
        set {
            clearButtonModes = newValue
            contentInput.clearButtonMode = clearButtonModes
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(searchIcon)
        addSubview(contentInput)
        
        setConstraints()
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 10))
        contentInput.leftView = paddingView
        contentInput.leftViewMode = .always
        contentInput.attributedPlaceholder = NSAttributedString(string: placeHolders, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColors])
        contentInput.textColor = textColor
        contentInput.clearButtonMode = clearButtonModes
        contentInput.returnKeyType = .search
        contentInput.delegate = self
        
        searchIcon.image = icons
        
        self.layer.borderWidth = borderWidths
        self.layer.borderColor = borderColors.cgColor
        self.backgroundColor = UIColor(hex: 0xEEEEEE)
    }
    
    func setConstraints() {
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        searchIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        searchIcon.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3.2 / 6.0).isActive = true
        searchIcon.widthAnchor.constraint(equalTo: searchIcon.heightAnchor).isActive = true
        
        contentInput.translatesAutoresizingMaskIntoConstraints = false
        contentInput.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10).isActive = true
        contentInput.centerYAnchor.constraint(equalTo: searchIcon.centerYAnchor).isActive = true
        contentInput.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentInput.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height * 0.5
    }
    
    open override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.layer.cornerRadius = self.bounds.height * 0.5
    }
}

extension EgretSearchInputView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.returnAction(textField)
        return true
    }
}
