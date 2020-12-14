//
//  EgretInputView.swift
//  Fool
//
//  Created by 徐文杰 on 2020/10/13.
//  Copyright © 2020 Free VPN Foundation. All rights reserved.
//

import UIKit

open class EgretInputView: UIView {
    
    private let titleLabel = UILabel()
    private let einputView = UIView()
    private let contentInput = UITextField()
    private let codeView = UIView()
    private let submit = UIButton()
    
    private let codeLabel = UILabel()
    private let codeArrow = UIImageView()
    private let codeSelectView = EgretCodeSelectView()
    private let alphaBGView = UIView()
    private var parentController = UIViewController()
    
    var timer: Timer?
    var submitEnable = true
    
    private var haveCodeSelects: Bool = false
    open var haveCodeSelect: Bool {
        get {
            return haveCodeSelects
        }
        
        set {
            haveCodeSelects = newValue
            buildContent()
            buildCodeSelectView()
        }
    }
    
    private var haveSubmits: Bool = false
    open var haveSubmit: Bool {
        get {
            return haveSubmits
        }
        
        set {
            haveSubmits = newValue
            buildContent()
        }
    }
    
    private var sendTitles: String = "Send"
    open var sendTitle: String {
        get {
            return sendTitles
        }
        
        set {
            sendTitles = newValue
            submit.setTitle(sendTitles, for: .normal)
        }
    }
    
    private var enableds: Bool = true
    open var enabled: Bool {
        get {
            return enableds
        }
        
        set {
            enableds = newValue
            self.alpha = newValue ? 1 : 0.5
            self.isUserInteractionEnabled = newValue
        }
    }
    
    open var title: String? {
        get {
            return titleLabel.text
        }
        
        set {
            titleLabel.text = newValue
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
    
    private var counters = 3
    private var tmp = 3
    open var counter: Int {
        get {
            return counters
        }
        
        set {
            counters = newValue
            tmp = newValue
        }
    }
    
    open var submitActoin: (() -> Void)?
    open var text: String? {
        get {
            return contentInput.text
        }
        
        set {
            contentInput.text = newValue
        }
    }
    
    open var code: String? {
        return codeLabel.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(einputView)
        
        titleLabel.textColor = UIColor.My.contentgreen
        titleLabel.text = "电话号"
        titleLabel.font = UIFont(name: "PingFangSC-Medium", size: 13)
        
        einputView.backgroundColor = UIColor(hex: 0xF0F0F0)
        einputView.layer.cornerRadius = 4
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        einputView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        einputView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        einputView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        einputView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        einputView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        einputView.layer.masksToBounds = true
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 10))
        contentInput.leftView = paddingView
        contentInput.leftViewMode = .always
        
        setCodeView()
        setSubmit()
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataReload(_:)), name: NSNotification.Name(rawValue: "reloadCountryData"), object: nil)
    }
    
    func buildContent() {
        einputView.removeAllSubviews()
        
        einputView.addSubview(contentInput)
        contentInput.translatesAutoresizingMaskIntoConstraints = false
        contentInput.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contentInput.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        if haveCodeSelect {
            einputView.addSubview(codeView)
            codeView.translatesAutoresizingMaskIntoConstraints = false
            codeView.leadingAnchor.constraint(equalTo: einputView.leadingAnchor).isActive = true
            codeView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            codeView.widthAnchor.constraint(equalTo: einputView.widthAnchor, multiplier: 0.214).isActive = true
            codeView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        }
        
        if haveSubmit {
            einputView.addSubview(submit)
            
            submit.translatesAutoresizingMaskIntoConstraints = false
            submit.trailingAnchor.constraint(equalTo: einputView.trailingAnchor).isActive = true
            submit.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            submit.widthAnchor.constraint(equalTo: einputView.widthAnchor, multiplier: 0.284).isActive = true
            submit.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        }
        
        if haveCodeSelect {
            contentInput.leadingAnchor.constraint(equalTo: codeView.trailingAnchor).isActive = true
        } else {
            contentInput.leadingAnchor.constraint(equalTo: einputView.leadingAnchor).isActive = true
        }
        
        if haveSubmit {
            contentInput.trailingAnchor.constraint(equalTo: submit.leadingAnchor).isActive = true
        } else {
            contentInput.trailingAnchor.constraint(equalTo: einputView.trailingAnchor).isActive = true
        }
    }
    
    func buildCodeSelectView() {
        if let view = self.parentViewController {
            parentController = view
            parentController.view.addSubview(alphaBGView)
            view.view.addSubview(codeSelectView)
            
            codeSelectView.frame = CGRect(x: 0, y: view.view.vHeight, width: view.view.vWidth, height: view.view.vHeight * 0.5 + 50)
            codeSelectView.backgroundColor = .white
            
            var celldata: [[String]] = []
            for index in 0...10 {
                let value = "test\(index)"
                let code = "884\(index)"
                
                celldata.append([value, code])
            }
            codeSelectView.data = countryCodes
            
            codeSelectView.cornerRadius = 10
        }
    }
    
    func setCodeView() {
        let line = UIView()
        let stackView = UIStackView()
        line.backgroundColor = UIColor(hex: 0xCCCCCC)
        
        codeView.addSubview(stackView)
        codeView.addSubview(line)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: codeView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: codeView.centerXAnchor).isActive = true
        
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        
        stackView.addArrangedSubview(codeLabel)
        stackView.addArrangedSubview(codeArrow)
        
        codeLabel.text = "8848"
        codeLabel.textColor = UIColor.My.contentgreen
        codeLabel.font = UIFont(name: "PingFangSC-Medium", size: 12)
        
        codeArrow.image = UIImage(named: "codeArrow", in: Resources.bundle, compatibleWith: nil)
        codeArrow.translatesAutoresizingMaskIntoConstraints = false
        codeArrow.heightAnchor.constraint(equalTo: codeView.heightAnchor, multiplier: 0.4).isActive = true
        codeArrow.widthAnchor.constraint(equalTo: codeArrow.heightAnchor).isActive = true
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.trailingAnchor.constraint(equalTo: codeView.trailingAnchor).isActive = true
        line.centerYAnchor.constraint(equalTo: codeView.centerYAnchor).isActive = true
        line.heightAnchor.constraint(equalTo: codeView.heightAnchor, multiplier: 0.7).isActive = true
        line.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        codeView.isUserInteractionEnabled = true
        codeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(codeClick)))
    }
    
    func setSubmit() {
        let line = UIView()
        line.backgroundColor = UIColor(hex: 0xCCCCCC)
        
        submit.addSubview(line)
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.leadingAnchor.constraint(equalTo: submit.leadingAnchor).isActive = true
        line.centerYAnchor.constraint(equalTo: submit.centerYAnchor).isActive = true
        line.heightAnchor.constraint(equalTo: submit.heightAnchor, multiplier: 0.7).isActive = true
        line.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        submit.setTitle(sendTitles, for: .normal)
        submit.setTitleColor(UIColor.My.contentgreen, for: .normal)
        submit.titleLabel?.font = UIFont(name: "PingFangSC-Medium", size: 13)
        
        submit.addTarget(self, action: #selector(submitClick), for: .touchUpInside)
    }
    
    func dismissCodeSelector() {
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.alphaBGView.alpha = 0
                        self.codeSelectView.originY = self.parentController.view.vHeight
                       },
                       completion: { value in
                        if value {
                            self.alphaBGView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                        }
                       })
    }
    
    func startTimer() {
        submitEnable = false
        submit.alpha = 0.5
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tikTok), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EgretInputView {
    @objc func codeClick() {
        
        alphaBGView.frame = parentController.view.frame
        alphaBGView.alpha = 0
        alphaBGView.backgroundColor = .black
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0,
                       options: .allowUserInteraction,
                       animations: {
                        self.alphaBGView.alpha = 0.5
                        self.codeSelectView.originY = self.parentController.view.vHeight - self.codeSelectView.vHeight + 50
                       },
                       completion: { value in
                        if value {
                            self.alphaBGView.isUserInteractionEnabled = true
                            self.alphaBGView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissView)))
                        }
                       })
    }
    
    @objc func submitClick() {
        
        guard submitEnable else { return }
        if let action = submitActoin { action() }
    }
    
    @objc func dismissView() {
        dismissCodeSelector()
    }
    
    @objc func dataReload(_ notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let cell = dict["cell"] as? [String] {
                codeLabel.text = cell[1]
                dismissCodeSelector()
            }
        }
    }
    
    @objc func tikTok() {
        if tmp > 0 {
            submit.setTitle("\(tmp) s", for: .normal)
            tmp -= 1
        } else {
            tmp = counter
            submit.setTitle("发送", for: .normal)
            timer?.invalidate()
            submit.alpha = 1
            submitEnable = true
        }
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
