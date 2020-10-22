//
//  EgretCodeSelectView.swift
//  Fool
//
//  Created by 徐文杰 on 2020/10/13.
//  Copyright © 2020 Free VPN Foundation. All rights reserved.
//

import UIKit

class EgretCodeSelectView: UIView {
    
    let searchView = UIView()
    let searchIcon = UIImageView(image: UIImage(named: "iconsearch", in: Resources.bundle, compatibleWith: nil))
    
    let searchInput = UITextField()
    
    let tableView = UITableView()
    private var celldata: [[String]] = []
    var selectAction: (() -> String)?
    
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    var tmp: [[String]] = []
    var data: [[String]] {
        get {
            return celldata
        }
        
        set {
            celldata = newValue
            tmp = newValue
            tableView.reloadData()
            
            if !newValue.isEmpty {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadCountryData"), object: nil, userInfo: ["cell": newValue[0]])
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(searchView)
        addSubview(tableView)
        
        searchView.addSubview(searchIcon)
        searchView.addSubview(searchInput)
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        searchView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchView.layoutIfNeeded()
        searchView.layer.cornerRadius = searchView.vHeight * 0.5
        searchView.layer.borderWidth = 1.3
        searchView.layer.borderColor = UIColor(hex: 0xCCCCCC).cgColor
        
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchIcon.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 20).isActive = true
        searchIcon.heightAnchor.constraint(equalTo: searchView.heightAnchor, multiplier: 0.5).isActive = true
        searchIcon.widthAnchor.constraint(equalTo: searchIcon.heightAnchor).isActive = true
        
        searchInput.translatesAutoresizingMaskIntoConstraints = false
        searchInput.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchInput.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10).isActive = true
        searchInput.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: 10).isActive = true
        searchInput.heightAnchor.constraint(equalTo: searchView.heightAnchor, constant: 0.7).isActive = true
        searchInput.returnKeyType = .search
        searchInput.delegate = self
        
        searchInput.placeholder = "搜索"
        setTableView()
    }
    
    func setTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        tableView.layoutIfNeeded()
        
        tableView.dataSource = self
        tableView.isEditing = false
        tableView.delegate = self
        tableView.separatorColor = UIColor(hex: 0xCCCCCC)
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.rowHeight = 45
        tableView.allowsSelection = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EgretCodeSelectView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CountryCodeTableViewCell()
        cell.selectionStyle = .none
        cell.setContent(country: tmp[indexPath.row][0], countryCode: tmp[indexPath.row][1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("HELLO")
        
        if indexPath.row < tmp.count {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadCountryData"), object: nil, userInfo: ["cell": tmp[indexPath.row]])
        }
    }
}

extension EgretCodeSelectView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let value = textField.text else {
            tmp = data
            tableView.reloadData()
            return true
        }
        
        if value.isEmpty {
            tmp = data
            tableView.reloadData()
            return true
        }
        
        tmp = data.filter {
            return !$0.filter {
                $0.contains(value)
            }.isEmpty
        }
        
        tableView.reloadData()
        return true
    }
}
