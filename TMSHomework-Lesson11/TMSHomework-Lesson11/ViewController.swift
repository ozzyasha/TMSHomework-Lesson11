//
//  ViewController.swift
//  TMSHomework-Lesson11
//
//  Created by Наталья Мазур on 25.12.23.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    var displayLabel = UILabel()
    var fakeLabel = UILabel()
    var operation = ""
    var number = 0.0
    let displayLabelSize = 85
    
    let buttonsSpacing = 15
    
    let digitArrayTop = ["7", "8", "9"]
    var digitTopButtons: [UIButton] = []
    
    let digitArrayCenter = ["4", "5", "6"]
    var digitCenterButtons: [UIButton] = []
    
    let digitArrayBottom = ["1", "2", "3"]
    var digitBottomButtons: [UIButton] = []
    
    let bottomArray = ["0", "."]
    var bottomArrayButtons: [UIButton] = []
    
    let greyOperationsArray = ["AC", "√", "%"]
    var greyOperationsArrayButtons: [UIButton] = []
    
    let orangeOperationsArray = ["÷", "×", "-", "+", "="]
    var orangeOperationsArrayButtons: [UIButton] = []
    
    var digitsVStack = UIStackView()
    var orangeOperationsVStack = UIStackView()
    var fullButtonsHStack = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        setupFullButtonsHStack()
        setupDisplayLabelView()
        setupFakeLabelView()
        
    }
    
    func setupDisplayLabelView() {
        
        displayLabel.text = "0"
        displayLabel.textColor = UIColor.white
        displayLabel.textAlignment = .right
        displayLabel.font = displayLabel.font.withSize(CGFloat(displayLabelSize))
        
        view.addSubview(displayLabel)
        
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupDisplayLabelConstraints()
    }
    
    func setupFakeLabelView() {
        
        fakeLabel.text = "0"
        fakeLabel.textColor = UIColor.white
        fakeLabel.textAlignment = .right
        fakeLabel.font = displayLabel.font.withSize(CGFloat(displayLabelSize))
        fakeLabel.isHidden = true
        
        view.addSubview(fakeLabel)
        
        fakeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupFakeLabelConstraints()
    }
    
    
    func setupButtonView(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        setupButtonsConstraints(button: button)
        let buttonWidth = (Int(view.frame.width) - (5 * buttonsSpacing))/4
        button.layer.cornerRadius = CGFloat(buttonWidth/2)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setupGreyOperationsArrayButtonsView() {
        greyOperationsArray.forEach { symbol in
            let symbolButton = UIButton()
            setupButtonView(button: symbolButton, title: symbol)
            symbolButton.setTitleColor(UIColor.black, for: .normal)
            symbolButton.backgroundColor = UIColor.systemGray
            greyOperationsArrayButtons.append(symbolButton)
        }
    }
    
    func setupDigitTopButtonsView() {
        digitArrayTop.forEach { digit in
            let digitButton = UIButton()
            setupButtonView(button: digitButton, title: digit)
            digitButton.backgroundColor = UIColor.darkGray
            digitTopButtons.append(digitButton)
        }
    }
    
    func setupDigitCenterButtonsView() {
        digitArrayCenter.forEach { digit in
            let digitButton = UIButton()
            setupButtonView(button: digitButton, title: digit)
            digitButton.backgroundColor = UIColor.darkGray
            digitCenterButtons.append(digitButton)
        }
    }
    
    func setupDigitBottomButtonsView() {
        digitArrayBottom.forEach { digit in
            let digitButton = UIButton()
            setupButtonView(button: digitButton, title: digit)
            digitButton.backgroundColor = UIColor.darkGray
            digitBottomButtons.append(digitButton)
        }
    }
    
    func setupBottomArrayButtonsView() {
        bottomArray.forEach { symbol in
            let symbolButton = UIButton()
            setupButtonView(button: symbolButton, title: symbol)
            symbolButton.backgroundColor = UIColor.darkGray
            if symbol == "0" {
                symbolButton.contentHorizontalAlignment = .left
                let buttonWidth = (Int(view.frame.width) - 5 * buttonsSpacing)/4
                symbolButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: CGFloat((buttonWidth/2/2 + buttonsSpacing/2)), bottom: 0, right: 0)
            }
            bottomArrayButtons.append(symbolButton)
        }
    }
    
    func setupOrangeOperationsArrayButtonsView() {
        orangeOperationsArray.forEach { symbol in
            
            let symbolButton = UIButton()
            setupButtonView(button: symbolButton, title: symbol)
            symbolButton.backgroundColor = UIColor.orange
            orangeOperationsArrayButtons.append(symbolButton)
        }
    }
    
    
    func setupDigitsVStack() {
        
        digitsVStack.axis = .vertical
        digitsVStack.alignment = .center
        digitsVStack.spacing = CGFloat(buttonsSpacing)
        
        
        setupGreyOperationsArrayButtonsView()
        
        let greyOperationsArrayHStack = UIStackView()
        
        greyOperationsArrayButtons.forEach { button in
            
            greyOperationsArrayHStack.axis = .horizontal
            greyOperationsArrayHStack.alignment = .center
            greyOperationsArrayHStack.spacing = CGFloat(buttonsSpacing)
            
            greyOperationsArrayHStack.addArrangedSubview(button)
        }
        
        setupDigitTopButtonsView()
        
        let digitsTopHStack = UIStackView()
        
        digitTopButtons.forEach { button in
            
            digitsTopHStack.axis = .horizontal
            digitsTopHStack.alignment = .center
            digitsTopHStack.spacing = CGFloat(buttonsSpacing)
            
            digitsTopHStack.addArrangedSubview(button)
            
        }
        
        setupDigitCenterButtonsView()
        
        let digitsCenterHStack = UIStackView()
        
        digitCenterButtons.forEach { button in
            
            digitsCenterHStack.axis = .horizontal
            digitsCenterHStack.alignment = .center
            digitsCenterHStack.spacing = CGFloat(buttonsSpacing)
            
            digitsCenterHStack.addArrangedSubview(button)
            
        }
        
        setupDigitBottomButtonsView()
        
        let digitsBottomHStack = UIStackView()
        
        digitBottomButtons.forEach { button in
            
            digitsBottomHStack.axis = .horizontal
            digitsBottomHStack.alignment = .center
            digitsBottomHStack.spacing = CGFloat(buttonsSpacing)
            
            digitsBottomHStack.addArrangedSubview(button)
            
        }
        
        setupBottomArrayButtonsView()
        
        let bottomArrayHStack = UIStackView()
        
        bottomArrayButtons.forEach { button in
            bottomArrayHStack.axis = .horizontal
            bottomArrayHStack.alignment = .center
            bottomArrayHStack.spacing = CGFloat(buttonsSpacing)
            bottomArrayHStack.addArrangedSubview(button)
        }
        
        digitsVStack.addArrangedSubview(greyOperationsArrayHStack)
        digitsVStack.addArrangedSubview(digitsTopHStack)
        digitsVStack.addArrangedSubview(digitsCenterHStack)
        digitsVStack.addArrangedSubview(digitsBottomHStack)
        digitsVStack.addArrangedSubview(bottomArrayHStack)
        
    }
    
    func setupOrangeOperationsVStack() {
        
        
        orangeOperationsVStack.axis = .vertical
        orangeOperationsVStack.spacing = CGFloat(buttonsSpacing)
        orangeOperationsVStack.alignment = .center
        
        setupOrangeOperationsArrayButtonsView()
        
        orangeOperationsArrayButtons.forEach { button in
            orangeOperationsVStack.addArrangedSubview(button)
        }
        
    }
    
    func setupFullButtonsHStack() {
        
        view.addSubview(fullButtonsHStack)
        
        fullButtonsHStack.axis = .horizontal
        fullButtonsHStack.spacing = CGFloat(buttonsSpacing)
        fullButtonsHStack.alignment = .center
        
        setupDigitsVStack()
        setupOrangeOperationsVStack()
        
        fullButtonsHStack.addArrangedSubview(digitsVStack)
        fullButtonsHStack.addArrangedSubview(orangeOperationsVStack)
        
        fullButtonsHStack.translatesAutoresizingMaskIntoConstraints = false
        setupFullButtonsHStackConstraints()
    }
    
    func setupButtonsConstraints(button: UIButton) {
        
        let buttonWidth = (Int(view.frame.width) - (5 * buttonsSpacing))/4
        
        if button.titleLabel?.text == "0" {
            button.snp.makeConstraints { make in
                make.width.equalTo(buttonWidth*2+buttonsSpacing)
                make.height.equalTo(buttonWidth)
            }
        } else {
            button.snp.makeConstraints { make in
                make.width.equalTo(buttonWidth)
                make.height.equalTo(buttonWidth)
            }
        }
    }
    
    func setupFullButtonsHStackConstraints() {
        fullButtonsHStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }

    func setupDisplayLabelConstraints() {
        displayLabel.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.bottom.equalTo(fullButtonsHStack.snp_topMargin).offset(-20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    func setupFakeLabelConstraints() {
        fakeLabel.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.bottom.equalTo(fullButtonsHStack.snp_topMargin).offset(-20)
        }
    }
    
    func checkDisplayLabelSize() {
        switch displayLabel.text?.count {
        case 0, 1, 2, 3, 4, 5, 6:
            displayLabel.font = displayLabel.font.withSize(CGFloat(displayLabelSize))
        case 7:
            displayLabel.font = displayLabel.font.withSize(CGFloat(displayLabelSize-10))
        case 8:
            displayLabel.font = displayLabel.font.withSize(CGFloat(displayLabelSize-20))
        case 9:
            displayLabel.font = displayLabel.font.withSize(CGFloat(displayLabelSize-30))
        default:
            let str: String = displayLabel.text ?? "No value"
            let limitedStr = String(str.prefix(9))
            displayLabel.text = limitedStr
        }
    }
    
    func checkFakeLabelSize() {
        switch fakeLabel.text?.count {
        case 0, 1, 2, 3, 4, 5, 6:
            fakeLabel.font = fakeLabel.font.withSize(CGFloat(displayLabelSize))
        case 7:
            fakeLabel.font = fakeLabel.font.withSize(CGFloat(displayLabelSize-10))
        case 8:
            fakeLabel.font = fakeLabel.font.withSize(CGFloat(displayLabelSize-20))
        case 9:
            fakeLabel.font = fakeLabel.font.withSize(CGFloat(displayLabelSize-30))
        default:
            let str: String = fakeLabel.text ?? "No value"
            let limitedStr = String(str.prefix(9))
            fakeLabel.text = limitedStr
        }
    }
    
    func countDecimalDigits(_ number: Double) -> Int {
        let numberAsString = String(number)
        
        if let dotIndex = numberAsString.firstIndex(of: ".") {
            return numberAsString.distance(from: dotIndex, to: numberAsString.endIndex) - 1
        }
        
        return 0
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        switch sender.titleLabel?.text {
        case "AC":
            fakeLabel.isHidden = true
            sender.setBackgroundImage(UIImage(named: "whiteButton"), for: .highlighted)
            displayLabel.text = "0"
            operation = "AC"
            
            orangeOperationsArrayButtons.forEach { button in
                button.backgroundColor = UIColor.orange
                button.setTitleColor(UIColor.white, for: .normal)
            }
            
        case "0", ".", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            fakeLabel.isHidden = true
            sender.setBackgroundImage(UIImage(named: "buttonWithOpacity50"), for: .highlighted)
            if displayLabel.text == "0" && sender.titleLabel?.text != "." {
                displayLabel.text = sender.titleLabel?.text
            } else if displayLabel.text!.contains(".") && sender.titleLabel?.text == "."{
                displayLabel.text = displayLabel.text
            } else {
                displayLabel.text! += sender.titleLabel?.text ?? "?"
            }
            checkDisplayLabelSize()
        case "+":
            let firstNumber = Double(displayLabel.text ?? "Error") ?? 0.0000
            number = firstNumber
            fakeLabel.text = displayLabel.text
            displayLabel.text = ""
            fakeLabel.isHidden = false
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.orange, for: .normal)
            operation = "+"
            checkDisplayLabelSize()
        case "-":
            let firstNumber = Double(displayLabel.text ?? "Error") ?? 0.0000
            number = firstNumber
            fakeLabel.text = displayLabel.text
            displayLabel.text = ""
            fakeLabel.isHidden = false
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.orange, for: .normal)
            operation = "-"
            checkDisplayLabelSize()
        case "÷":
            let firstNumber = Double(displayLabel.text ?? "Error") ?? 0.0000
            number = firstNumber
            fakeLabel.text = displayLabel.text
            displayLabel.text = ""
            fakeLabel.isHidden = false
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.orange, for: .normal)
            operation = "/"
            checkDisplayLabelSize()
        case "×":
            let firstNumber = Double(displayLabel.text ?? "Error") ?? 0.0000
            number = firstNumber
            fakeLabel.text = displayLabel.text
            displayLabel.text = ""
            fakeLabel.isHidden = false
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.orange, for: .normal)
            operation = "*"
            checkDisplayLabelSize()
        case "√":
            sender.setBackgroundImage(UIImage(named: "whiteButton"), for: .highlighted)
            let firstNumber = Double(displayLabel.text ?? "Error") ?? 0.0000
            number = firstNumber
            displayLabel.text = ""
            
            let root = sqrt(number)
            if root.truncatingRemainder(dividingBy: 1) == 0 {
                displayLabel.text = "\(Int(root))"
            } else {
                displayLabel.text = "\(root)"
            }
            checkDisplayLabelSize()
        case "%":
            sender.setBackgroundImage(UIImage(named: "whiteButton"), for: .highlighted)
            let firstNumber = Double(displayLabel.text ?? "Error") ?? 0.0000
            number = firstNumber
            displayLabel.text = ""
            operation = "%"
            
            let percent = number/100
            if percent.truncatingRemainder(dividingBy: 1) == 0 {
                displayLabel.text = "\(Int(percent))"
            } else {
                displayLabel.text = "\(percent)"
            }
            checkDisplayLabelSize()
            
        case "=":
            
            fakeLabel.isHidden = true
            orangeOperationsArrayButtons.forEach { button in
                button.backgroundColor = UIColor.orange
                button.setTitleColor(UIColor.white, for: .normal)
            }
            sender.setBackgroundImage(UIImage(named: "buttonWithOpacity50"), for: .highlighted)
            
            let secondNumber = Double(displayLabel.text ?? "Error") ?? 0.0000
            checkDisplayLabelSize()
            
            switch operation {
            case "+":
                let sum = number + secondNumber
                if sum.truncatingRemainder(dividingBy: 1) == 0 {
                    displayLabel.text = "\(Int(sum))"
                } else {
                    
                    if countDecimalDigits(number) > countDecimalDigits(secondNumber) {
                        displayLabel.text = String(format: "%.\(countDecimalDigits(number))f", sum)
                    } else {
                        displayLabel.text = String(format: "%.\(countDecimalDigits(secondNumber))f", sum)
                    }
                    
                }
                checkDisplayLabelSize()
            case "-":
                let subtraction = number - secondNumber
                if subtraction.truncatingRemainder(dividingBy: 1) == 0 {
                    displayLabel.text = "\(Int(subtraction))"
                } else {
                    
                    if countDecimalDigits(number) > countDecimalDigits(secondNumber) {
                        displayLabel.text = String(format: "%.\(countDecimalDigits(number))f", subtraction)
                    } else {
                        displayLabel.text = String(format: "%.\(countDecimalDigits(secondNumber))f", subtraction)
                    }
                    
                }
                checkDisplayLabelSize()
            case "/":
                if secondNumber != 0 {
                    let division = number / secondNumber
                    
                    if division.truncatingRemainder(dividingBy: 1) == 0 {
                        displayLabel.text = "\(Int(division))"
                    } else {
                        displayLabel.text = "\(division)"
                    }
                    
                } else {
                    displayLabel.text = "Error"
                }
                checkDisplayLabelSize()
            case "*":
                let multiplication = number * secondNumber
                if multiplication.truncatingRemainder(dividingBy: 1) == 0 {
                    displayLabel.text = "\(Int(multiplication))"
                } else {
                    displayLabel.text = "\(multiplication)"
                }
                checkDisplayLabelSize()
            case "AC":
                displayLabel.text = "0"
                
            default:
                displayLabel.text = displayLabel.text
                checkDisplayLabelSize()
            }
            
        default:
            displayLabel.text! = "Unexpected error: no such button"
        }
        
        checkDisplayLabelSize()
        checkFakeLabelSize()
    }
    
}

/*
 Сверстать калькулятор на UIStackView +
 Уменьшить шрифт при наборе от 6 цифр +
 
 *********************
 При умножении больших цифр выводить как на айфоне число в степени
 Деление на ноль обработать +
 Вместо "+-" написать вычисление корня +
 
 */
