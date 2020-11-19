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
    
    let phoneInput = EgretInputView()
    let codeInput = EgretInputView()
    let button = EgretButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(phoneInput)
        view.addSubview(codeInput)
        view.addSubview(button)
        
        setInputGroup()
    }
    
    func setInputGroup() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false //他妈的点击屏蔽
        view.addGestureRecognizer(tap)
        
        phoneInput.translatesAutoresizingMaskIntoConstraints = false
        phoneInput.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneInput.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
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

