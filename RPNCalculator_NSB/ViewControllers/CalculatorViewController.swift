//
//  CalculatorViewController.swift
//  RPNCalculator_NSB
//
//  Created by Kamil Wrobel on 10/2/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    //MARK: - Properties - Regular
    let numberButtonColor : UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    let clearButtonColor : UIColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    let equalSignButtonColor : UIColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    let operandsButtonColor : UIColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    let fontsize = UIFont.boldSystemFont(ofSize: 20)
    
    let bottomPadding: CGFloat = 4
    let sidePadding: CGFloat = 8
    let topPaddind: CGFloat = 8

    //MARK: - Properties - Labels
    let topLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        return label
    }()
    let displayLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.text = "123456"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    //MARK: - Properties - Buttons
    
    lazy var number1Button : UIButton = {
        let button = UIButton(type: .system)
        buttonSetup(button: button, symbol: "1", color: numberButtonColor)
          return button
    }()
    
    lazy var number2Button : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: "2", color: numberButtonColor)
        return button
    }()
    
    lazy var number3Button : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: "3", color: numberButtonColor)
        return button
    }()
    
    lazy var number4Button : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: "4", color: numberButtonColor)
        return button
    }()
    
    lazy var number5Button : UIButton = {
        let button = UIButton(type: .system)
        buttonSetup(button: button, symbol: "5", color: numberButtonColor)
        return button
    }()
    
    lazy var number6Button : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: "6", color: numberButtonColor)
        return button
    }()
    
    lazy var number7Button : UIButton = {
        let button = UIButton(type: .system)
        buttonSetup(button: button, symbol: "7", color: numberButtonColor)
        return button
    }()
    
    lazy var number8Button : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: "8", color: numberButtonColor)
        return button
    }()
    
    lazy var number9Button : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: "9", color: numberButtonColor)
        return button
    }()
    
    lazy var number0Button : UIButton = {
        let button = UIButton(type: .system)
        buttonSetup(button: button, symbol: "0", color: numberButtonColor)
        return button
    }()
    
    lazy var additionButton : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: "+", color: operandsButtonColor)
        return button
    }()
    
    lazy var subtractionButton : UIButton = {
        let button = UIButton(type: .system)
 buttonSetup(button: button, symbol: "-", color: operandsButtonColor)
        return button
    }()
    
    
    lazy var multiplicationButton : UIButton = {
        let button = UIButton(type: .system)
        buttonSetup(button: button, symbol: "x", color: operandsButtonColor)
        return button
    }()
    
    lazy var divisionButton : UIButton = {
        let button = UIButton(type: .system)
        buttonSetup(button: button, symbol: "÷", color: operandsButtonColor)
        return button
    }()
    
    lazy var clearButton : UIButton = {
        let button = UIButton(type: .system)
        buttonSetup(button: button, symbol: "C", color: clearButtonColor)
        return button
    }()
    
    lazy var dotButton : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: ".", color: numberButtonColor)
        return button
    }()
    
    lazy var equalSignButton : UIButton = {
        let button = UIButton(type: .system)
       buttonSetup(button: button, symbol: "=", color: equalSignButtonColor)
        return button
    }()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        
        setupMainLabel()
        setupButtons()
        //call functions here
        
    }
    
    func setupMainLabel(){
        self.view.addSubview(topLabel)
        topLabel.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: self.view.frame.height/4)
        
        self.view.addSubview(displayLabel)
        displayLabel.anchor(top: nil, left: self.view.leftAnchor, bottom: topLabel.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: 40)
        
    }
    
    func setupButtons() {
        self.view.addSubview(clearButton)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.anchor(top: topLabel.bottomAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, paddingTop: 70, paddingLeft: 8, paddingBottom: self.bottomPadding, paddingRight: 8, width: (self.view.frame.width - (sidePadding + sidePadding))/2, height: 70)
        
        
        let firstRowStackView = UIStackView(arrangedSubviews: [number7Button, number8Button, number9Button, divisionButton])
        firstRowStackView.distribution = .fillEqually
        firstRowStackView.spacing = 5
        self.view.addSubview(firstRowStackView)
        firstRowStackView.anchor(top: clearButton.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: self.sidePadding, paddingBottom: self.bottomPadding, paddingRight: self.sidePadding, width: self.view.frame.width, height: 70)
        
        
        let secondRowStackView = UIStackView(arrangedSubviews: [number4Button, number5Button, number6Button, multiplicationButton])
        secondRowStackView.distribution = .fillEqually
        secondRowStackView.spacing = 5
        self.view.addSubview(secondRowStackView)
        secondRowStackView.anchor(top: firstRowStackView.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: self.sidePadding, paddingBottom: self.bottomPadding, paddingRight: self.sidePadding, width: self.view.frame.width, height: 70)
        
        
        let thirdRowStackView = UIStackView(arrangedSubviews: [number1Button, number2Button, number3Button, additionButton])
        thirdRowStackView.distribution = .fillEqually
        thirdRowStackView.spacing = 5
        self.view.addSubview(thirdRowStackView)
        thirdRowStackView.anchor(top: secondRowStackView.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: self.sidePadding, paddingBottom: self.bottomPadding, paddingRight: self.sidePadding, width: self.view.frame.width, height: 70)
        
        
        let fourthRowStackView = UIStackView(arrangedSubviews: [dotButton, number0Button, subtractionButton, equalSignButton])
        fourthRowStackView.distribution = .fillEqually
        fourthRowStackView.spacing = 5
        self.view.addSubview(fourthRowStackView)
        fourthRowStackView.anchor(top: thirdRowStackView.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: self.sidePadding, paddingBottom: self.bottomPadding, paddingRight: self.sidePadding, width: self.view.frame.width, height: 70)
        
    }
    
    
    
    //MARK: - Button Setup
    
    func buttonSetup(button: UIButton, symbol: String, color: UIColor){
        
        button.setTitle(symbol, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        let atributedText = NSMutableAttributedString(string: symbol, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        button.setAttributedTitle(atributedText, for: .normal)
        
    }
    
    
    
    
    


}
