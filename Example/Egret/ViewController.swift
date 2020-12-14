//
//  ViewController.swift
//  Egret
//
//  Created by Thisismy0312 on 10/22/2020.
//  Copyright (c) 2020 Thisismy0312. All rights reserved.
//

import UIKit
import Egret

class ViewController: HeaderViewController {
    
    let phoneInput = EgretInputView()
    let codeInput = EgretInputView()
    let button = EgretButton()
    
    let radioStackView = UIStackView()
    let radioButton1 = EgretRadioButton()
    let radioButton2 = EgretRadioButton()
    let radioButton3 = EgretRadioButton()
    let radioButton4 = EgretRadioButton()
    var radios: [EgretRadioButton] = []
    let radioData: [[String]] = [
        ["Student", "student"],
        ["Worker", "worker"],
        ["Superman", "superman"],
        ["Other", "other"]]
    
    let searchView = EgretSearchInputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        contentView.addSubview(phoneInput)
        contentView.addSubview(codeInput)
        contentView.addSubview(button)
        contentView.addSubview(searchView)
        contentView.addSubview(radioStackView)
        
        needArrow = false
        arrowAction = {
            print("GA GA GA !!!")
        }
        
        needRight = false
        rightAction = {
            print("LA LA LA !!!")
        }
        
        needRightLabel = true
        rightLabel.text = "刷新"
        rightLabelAction = {
            print("HA HA HA !!!")
        }
        
        setInputGroup()
        setSearch()
        setRadioButton()
        setButton()
        headerHeight = 80
    }
    
    func setInputGroup() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false //他妈的点击屏蔽
        view.addGestureRecognizer(tap)
        
        phoneInput.translatesAutoresizingMaskIntoConstraints = false
        phoneInput.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        phoneInput.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        phoneInput.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.893).isActive = true
        phoneInput.heightAnchor.constraint(equalToConstant: 37).isActive = true
        phoneInput.title = "手机"
        phoneInput.haveCodeSelect = true
        phoneInput.keyboardType = .numberPad
        phoneInput.layoutIfNeeded()
        
        codeInput.translatesAutoresizingMaskIntoConstraints = false
        codeInput.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        codeInput.topAnchor.constraint(equalTo: phoneInput.bottomAnchor, constant: 10).isActive = true
        codeInput.widthAnchor.constraint(equalTo: phoneInput.widthAnchor).isActive = true
        codeInput.heightAnchor.constraint(equalTo: phoneInput.heightAnchor).isActive = true
        codeInput.title = "验证码"
        codeInput.haveSubmit = true
        codeInput.keyboardType = .numberPad
        codeInput.counter = 120
        codeInput.submitActoin = {
            
        }
        codeInput.layoutIfNeeded()
        
    }
    
    func setSearch() {
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        searchView.topAnchor.constraint(equalTo: codeInput.bottomAnchor, constant: 10).isActive = true
        searchView.widthAnchor.constraint(equalTo: codeInput.widthAnchor).isActive = true
        searchView.heightAnchor.constraint(equalTo: codeInput.heightAnchor).isActive = true
        searchView.placeHolder = "Search"
        searchView.placeHolderColor = UIColor(hex: 0xCCCCCC)
        searchView.icon = UIImage(named: "icon_Search_Black")
        searchView.backgroundColor = .clear
        searchView.delegate = self
        searchView.layoutIfNeeded()
    }
    
    func setRadioButton() {
        radioStackView.translatesAutoresizingMaskIntoConstraints = false
        radioStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        radioStackView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 20).isActive = true
        
        radioStackView.axis = .vertical
        radioStackView.spacing = 17
        radioStackView.alignment = .leading
        
        radios = [radioButton1, radioButton2, radioButton3, radioButton4]
        
        radioStackView.addArrangedSubview(radioButton1)
        radioStackView.addArrangedSubview(radioButton2)
        radioStackView.addArrangedSubview(radioButton3)
        radioStackView.addArrangedSubview(radioButton4)
        
        for (index, item) in radios.enumerated() {
            radioStackView.addArrangedSubview(item)
            
            item.translatesAutoresizingMaskIntoConstraints = false
            item.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
            item.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            item.group = "JobGroup"
            item.index = index
//            item.selectedAction = { self.updateSelectedData() }
            item.checked = false
            item.title = radioData[index][0]
            item.value = radioData[index][1]
            item.checkedIcon = UIImage(named: "radioChecked")
            item.unCheckedIcon = UIImage(named: "radioUnchecked")
            item.titleColor = UIColor(hex: 0x17324D)
            item.titleFont = UIFont(name: "PingFangSC-Medium", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .regular)
            
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    func setButton() {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.topAnchor.constraint(equalTo: radioStackView.bottomAnchor, constant: 20).isActive = true
        button.colorHead = UIColor(hex: 0xEDCC99)
        button.colorTail = UIColor(hex: 0xC4925A)
        button.title = "Hello!"
        button.titleColor = .white
        button.backAction = { self.button.isEnabled = false }
        button.startPoint = CGPoint(x: 0, y: 1)
        button.endPoint = CGPoint(x: 1, y: 1)
        button.radius = 20
        button.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: SearchDelegate {
    func returnAction(_ textField: UITextField) {
        print(textField.text)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIColor {
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
}
