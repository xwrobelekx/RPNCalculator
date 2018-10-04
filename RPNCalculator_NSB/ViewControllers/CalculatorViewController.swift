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
    var count = 0
    var result = ""
    var firstNumber : String = ""
    var secondNumber: String = ""
    var operationSybmol : String = ""
    var wasEqualSignPressed: Bool = false
    var topLabelString = "" {
        didSet{
            updateTopLabel()
        }
    }
    var wasoperationButtonPressed : Bool = false

    var displayLabelString : String = "" {
        didSet {
            updateDisplayLabel()
        }
    }

    
    //MARK: - Properties - Labels
    let topLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let displayLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    let topView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
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
        buttonSetup(button: button, symbol: "×", color: operandsButtonColor)
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
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        setupMainLabel()
        setupButtons()
        setupActionButtons()
        
    }
    
    
    //MARK: - View Layout
    func setupMainLabel(){
        self.view.addSubview(topView)
        topView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: self.view.frame.height/4)
        
        self.view.addSubview(topLabel)
        topLabel.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: self.view.frame.height/4)
        
        self.view.addSubview(displayLabel)
        displayLabel.anchor(top: nil, left: self.view.leftAnchor, bottom: topLabel.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: 50)
        
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
    
    
    func setupActionButtons() {
        number0Button.addTarget(self, action: #selector(zeroButton(button:)), for: .touchUpInside)
        number1Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        number2Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        number3Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        number4Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        number5Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        number6Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        number7Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        number8Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        number9Button.addTarget(self, action: #selector(button(button:)), for: .touchUpInside)
        additionButton.addTarget(self, action: #selector(operation(_:)), for: .touchUpInside)
        subtractionButton.addTarget(self, action: #selector(operation(_:)), for: .touchUpInside)
        multiplicationButton.addTarget(self, action: #selector(operation(_:)), for: .touchUpInside)
        divisionButton.addTarget(self, action: #selector(operation(_:)), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButton(_:)), for: .touchUpInside)
        dotButton.addTarget(self, action: #selector(dotButton(button:)), for: .touchUpInside)
        equalSignButton.addTarget(self, action: #selector(equalSignButton(_:)), for: .touchUpInside)
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

    
    
    //MARK: - HelperMethods
    func updateDisplayLabel() {
        if wasoperationButtonPressed {
            displayLabel.text = firstNumber
        } else {
        displayLabel.text = displayLabelString
        }
    }
    
    func updateTopLabel() {
        topLabel.text = topLabelString
    }
    
    
    @objc func button(button: UIButton){
        if !displayLabelString.contains(".") && displayLabelString.first == "0" {
            displayLabelString.removeFirst()
            
        }
        wasoperationButtonPressed = false
        if wasEqualSignPressed {
            reset()
        }
        if displayLabelString.count < 8 {
        guard let text = button.titleLabel?.text else {return}
       self.displayLabelString += text
            
            self.topLabelString += text
        }
    }
    
    
    @objc func zeroButton(button: UIButton){
        if !displayLabelString.contains(".") && displayLabelString.first == "0" {
           displayLabelString.removeFirst()
            
        } else {
            
        wasoperationButtonPressed = false
        if wasEqualSignPressed {
            reset()
        }
        if displayLabelString.count < 8 {
            guard let text = button.titleLabel?.text else {return}
            self.displayLabelString += text
        }
        }
    }
    
    @objc func dotButton(button: UIButton){
        if wasEqualSignPressed {
            reset()
        }
        if displayLabelString.count < 8 {
        if count == 0 {
            count += 1
            print(count)
            guard let text = button.titleLabel?.text else {return}
            if self.displayLabelString == "" {
                self.displayLabelString = self.displayLabelString + "0" + text
            } else {
                self.displayLabelString = self.displayLabelString + text
            }
        }
        }
        
    }
    
    @objc func operation(_ operation: UIButton){
        
        self.firstNumber = displayLabelString
        
        if operation.titleLabel?.text == "+" {
            operationSybmol = "+"
        }
        if operation.titleLabel?.text == "-" {
            operationSybmol = "-"
        }
        if operation.titleLabel?.text == "×"{
            operationSybmol = "×"
        }
        if operation.titleLabel?.text == "÷"{
            operationSybmol = "÷"
        }
        displayLabel.text = firstNumber
        topLabelString += operationSybmol
        wasoperationButtonPressed = true
        differendReset()
    }
    
    @objc func clearButton(_ : UIButton){
        UIView.animate(withDuration: 1, animations: {
            self.topLabel.center.x -= self.view.frame.width
            self.displayLabel.center.x -= self.view.frame.width
        }) { (true) in
            self.reset()
        }
    }
    
    func differendReset(){
        displayLabelString = ""
        count = 0
       // characterCountInsDisplayString = 0
      
    }
    
    func reset(){
        displayLabelString = ""
        displayLabel.text = "0"
        count = 0
        firstNumber = ""
        secondNumber = ""
        wasEqualSignPressed = false
        operationSybmol = ""
        wasoperationButtonPressed = false
        topLabelString = ""
    }
    
    @objc func equalSignButton(_ : UIButton){
        self.secondNumber = displayLabelString
        topLabelString += "="
        
        guard let firstDouble = Double(self.firstNumber) else {return}
        guard let secodnDouble = Double(self.secondNumber) else {return}
        
        if operationSybmol == "+" {
            result = String(CalculatorController.shared.mathOperation(firstNumber: firstDouble, secondNumber: secodnDouble, operation: CalculatorController.shared.add(firstNumber:to:)))
            displayLabelString = "\(result.clean())"
        }
        if operationSybmol == "-" {
            result = String(CalculatorController.shared.mathOperation(firstNumber: firstDouble, secondNumber: secodnDouble, operation: CalculatorController.shared.subtract(firstNumber:from:)))
            displayLabelString = "\(result.clean())"
            
        }
        if operationSybmol == "×"{
            result = String(CalculatorController.shared.mathOperation(firstNumber: firstDouble, secondNumber: secodnDouble, operation: CalculatorController.shared.multiply(firstNumber:with:)))
            displayLabelString = "\(result.clean())"
            
        }
        if operationSybmol == "÷"{
            result = String(CalculatorController.shared.mathOperation(firstNumber: firstDouble, secondNumber: secodnDouble, operation: CalculatorController.shared.divide(firstNumber:by:)))
            displayLabelString = "\(result.clean())"
            
        }
        wasEqualSignPressed = true
        wasoperationButtonPressed = false
    }
}

