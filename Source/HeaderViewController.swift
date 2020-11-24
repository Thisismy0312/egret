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
    let backArrow = UIImageView()
    var arrow = UIImage(named: "backarrow", in: Resources.bundle, compatibleWith: nil)
    
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
    
    private var arrowActions: (() -> Void)?
    open var arrowAction: (() -> Void)? {
        get {
            return arrowActions
        }
        
        set {
            arrowActions = newValue
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        view.addSubview(contentView)
        
        backArrow.image = arrow
        headerView.addSubview(backArrow)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        backArrow.centerYAnchor.constraint(equalTo: headerView.titleLabel.centerYAnchor).isActive = true
        backArrow.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 15).isActive = true
        backArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        backArrow.isUserInteractionEnabled = true
        backArrow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backArrowClick)))
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
}
