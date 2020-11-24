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
