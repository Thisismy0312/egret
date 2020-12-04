//
//  HeaderViewController.swift
//  Egret
//
//  Created by Linti on 2020/11/24.
//

import UIKit

open class HeaderViewController: UIViewController {

    var safeAreaTop: CGFloat = 20
    var safeAreaBottom: CGFloat = 0
    open var headerView = EgretHeaderView()
    open var contentView = UIView()
    open var rightLabel = UILabel()
    let backArrow = UIImageView()
    var arrow = UIImage(named: "icon_Header_Arrow", in: Resources.bundle, compatibleWith: nil)
    let rightIcon = UIImageView()
    var rightImg = UIImage(named: "icon_Header_Setting", in: Resources.bundle, compatibleWith: nil)
    let gradientLayer = CAGradientLayer.init()
    open var bgView = UIView()
    
    open var headTitle: String {
        get {
            return headerView.title
        }
        
        set {
            headerView.title = newValue
        }
    }
    
    open var headFont: UIFont {
        get {
            return headerView.font
        }
        
        set {
            headerView.font = newValue
        }
    }
    
    open var colorHead: UIColor {
        get {
            return headerView.colorHead
        }
        set {
            headerView.colorHead = newValue
        }
    }
    
    open var colorTail: UIColor {
        get {
            return headerView.colorTail
        }
        set {
            headerView.colorTail = newValue
        }
    }
    
    open var titleColor: UIColor {
        get {
            return headerView.titleColor
        }
        
        set {
            headerView.titleColor = newValue
        }
    }
    
    open var startPoint: CGPoint {
        get {
            return headerView.startPoint
        }
        
        set {
            headerView.startPoint = newValue
        }
    }
    
    open var endPoint: CGPoint {
        get {
            return headerView.endPoint
        }
        
        set {
            headerView.endPoint = newValue
        }
    }
    
    private var needArrows: Bool = false
    open var needArrow: Bool {
        get {
            return needArrows
        }
        
        set {
            needArrows = newValue
            backArrow.isHidden = !needArrows
        }
    }
    
    private var needRights: Bool = false
    open var needRight: Bool {
        get {
            return needRights
        }
        
        set {
            needRights = newValue
            rightIcon.isHidden = !needRights
        }
    }
    
    private var needRightLabels: Bool = false
    open var needRightLabel: Bool {
        get {
            return needRightLabels
        }
        
        set {
            needRightLabels = newValue
            rightLabel.isHidden = !needRightLabels
        }
    }
    
    private var rightImages: UIImage?
    open var rightImage: UIImage? {
        get {
            return rightImages
        }
        
        set {
            rightImages = newValue
            rightIcon.image = rightImages
        }
    }
    
    private var arrowActions: (() -> Void)?
    open var arrowAction: (() -> Void)? {
        get {
            return arrowActions
        }
        
        set {
            arrowActions = newValue
        }
    }
    
    private var rightActions: (() -> Void)?
    open var rightAction: (() -> Void)? {
        get {
            return rightActions
        }
        
        set {
            rightActions = newValue
        }
    }
    
    private var rightLabelActions: (() -> Void)?
    open var rightLabelAction: (() -> Void)? {
        get {
            return rightLabelActions
        }
        
        set {
            rightLabelActions = newValue
        }
    }
    
    private var needBgViews: Bool = false
    open var needBgView: Bool {
        get {
            return needBgViews
        }
        
        set {
            needBgViews = newValue
            bgView.isHidden = !needBgViews
        }
    }
    
    private var headerHeights: CGFloat = 100
    open var headerHeight: CGFloat {
        get {
            return headerHeights
        }
        
        set {
            headerHeights = newValue
            headerHeightLay.constant = headerHeights
            headerView.updateConstraints()
        }
    }
    
    var headerHeightLay = NSLayoutConstraint()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgView)
        view.addSubview(headerView)
        view.addSubview(contentView)
        
        backArrow.image = arrow
        rightIcon.image = rightImg
        
        headerView.addSubview(backArrow)
        headerView.addSubview(rightIcon)
        headerView.addSubview(rightLabel)
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bgView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bgView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bgView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        bgView.isHidden = true
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerHeightLay = headerView.heightAnchor.constraint(equalToConstant: 100)
        headerHeightLay.isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        backArrow.centerYAnchor.constraint(equalTo: headerView.titleLabel.centerYAnchor).isActive = true
        backArrow.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15).isActive = true
        backArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.centerYAnchor.constraint(equalTo: headerView.titleLabel.centerYAnchor).isActive = true
        rightIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15).isActive = true
        rightIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.centerYAnchor.constraint(equalTo: headerView.titleLabel.centerYAnchor).isActive = true
        rightLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15).isActive = true
        
        backArrow.isUserInteractionEnabled = true
        backArrow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backArrowClick)))
        
        rightIcon.isUserInteractionEnabled = true
        rightIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightClick)))
        
        rightLabel.text = "编辑"
        rightLabel.textColor = .white
        rightLabel.font = UIFont.My.pingfang(15, .regular)
        rightLabel.isHidden = true
        rightLabel.isUserInteractionEnabled = true
        rightLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightLabelClick)))
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) {
            safeAreaTop = view.safeAreaInsets.top
            safeAreaBottom = view.safeAreaInsets.bottom
        } else {
            safeAreaTop = topLayoutGuide.length
            safeAreaBottom = bottomLayoutGuide.length
        }
        
        headerView.setSafeArea(safeAreaTop)
        view.layoutIfNeeded()
    }
}

extension HeaderViewController {
    @objc func backArrowClick() {
        if let action = arrowActions { action() }
    }
    
    @objc func rightClick() {
        if let action = rightActions { action() }
    }
    
    @objc func rightLabelClick() {
        if let action = rightLabelActions { action() }
    }
}
