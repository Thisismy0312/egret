//
//  ViewController.swift
//  Egret
//
//  Created by Thisismy0312 on 10/22/2020.
//  Copyright (c) 2020 Thisismy0312. All rights reserved.
//

import UIKit
import Egret

class ViewController: UIViewController {
    
    let headerView = EgretHeaderView()
    let phoneInput = EgretInputView()
    let codeInput = EgretInputView()
    let button = EgretButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(headerView)
        view.addSubview(phoneInput)
        view.addSubview(codeInput)
        view.addSubview(button)
        
        setHeader()
        setInputGroup()
    }
    
    func setHeader() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerView.title = "Egret"
    }
    
    func setInputGroup() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false //他妈的点击屏蔽
        view.addGestureRecognizer(tap)
        
        phoneInput.translatesAutoresizingMaskIntoConstraints = false
        phoneInput.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneInput.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50).isActive = true
        phoneInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.893).isActive = true
        phoneInput.heightAnchor.constraint(equalToConstant: 37).isActive = true
        phoneInput.title = "手机"
        phoneInput.haveCodeSelect = true
        phoneInput.keyboardType = .numberPad
        phoneInput.layoutIfNeeded()
        
        codeInput.translatesAutoresizingMaskIntoConstraints = false
        codeInput.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.topAnchor.constraint(equalTo: codeInput.bottomAnchor, constant: 20).isActive = true
        button.colorHead = .purple
        button.colorTail = .blue
        button.title = "Hello!"
        button.titleColor = .white
        button.backAction = { print("Nice Click!") }
        button.startPoint = CGPoint(x: 0, y: 0)
        button.endPoint = CGPoint(x: 0, y: 1)
        button.radius = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

