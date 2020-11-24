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
    let headerView = EgretHeaderView()
    open var contentView = UIView()
    
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
    
    private var titleColors: UIColor = UIColor(hex: 0xFFFFFF)
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
    
    private var endPoints: CGPoint = CGPoint.init(x: 1, y: 1)
    open var endPoint: CGPoint {
        get {
            return headerView.endPoint
        }
        
        set {
            headerView.endPoint = newValue
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        view.addSubview(contentView)
        
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
