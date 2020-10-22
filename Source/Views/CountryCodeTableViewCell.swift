//
//  CountryCodeTableViewCell.swift
//  Fool
//
//  Created by 徐文杰 on 2020/10/13.
//  Copyright © 2020 Free VPN Foundation. All rights reserved.
//

import UIKit

class CountryCodeTableViewCell: UITableViewCell {

    let title = UILabel()
    let code = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(title)
        addSubview(code)
        
        title.textColor = UIColor.My.contentgreen
        title.font = UIFont(name: "PingFangSC-Regular", size: 15)
        
        code.textColor = UIColor.My.contentgreen
        code.font = UIFont(name: "PingFangSC-Regular", size: 15)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.textAlignment = .left
        
        code.translatesAutoresizingMaskIntoConstraints = false
        code.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        code.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        code.textAlignment = .right
    }
    
    func setContent(country: String, countryCode: String) {
        title.text = country
        code.text = "+\(countryCode)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
