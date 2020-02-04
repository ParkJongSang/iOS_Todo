//
//  CalculatoreView.swift
//  day03Calculator
//
//  Created by naver on 2020/02/04.
//  Copyright © 2020 ParkJongSang. All rights reserved.
//

import UIKit

class Calculator : UIView{

    final let buttonsTitle = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", "0", ".", "="]
    ]

    var currentOperator = ""
    var oldValue: Double? = nil
    var newValue: Double? = nil
    var pointFlag: Bool = false
    var displayLabel : UILabel
    var inputButtons : [UIButton]{
        let originX: Int = 20
        let originY: Int = 160
        var buttons = [UIButton]()
        for i in 0..<4 {
            for j in 0..<5 {
                let button: UIButton

                if i == 0 && j == 4 {
                    button = UIButton.init(frame: CGRect(
                        x: originX + i * 100,
                        y: originY + j * 100,
                        width: 180,
                        height: 80
                    ))
                }
                else{
                    button = UIButton.init(frame: CGRect(
                        x: originX + i * 100,
                        y: originY + j * 100,
                        width: 80,
                        height: 80
                    ))
                }

                if i == 1 && j == 4 { continue }

                if isOp(self.buttonsTitle[j][i]) {
                    button.addTarget(self, action: #selector(inputOp(_:)), for: .touchUpInside)
                } else {
                    button.addTarget(self, action: #selector(inputNumber(_:)), for: .touchUpInside)
                }
                button.backgroundColor = .gray

                button.setTitle(self.buttonsTitle[j][i], for: .normal)
                buttons.append(button)

                if j == 0 {
                    button.backgroundColor = .darkGray
                }
                if i == 3 {
                    button.backgroundColor = .orange
                }
            }
        }
        return buttons
    }

    override init(frame: CGRect){
        displayLabel = UILabel.init(frame: CGRect(
            x: 20,
            y: 60,
            width : 380,
            height : 50
        ))
        super.init(frame: frame)
        displayLabel.backgroundColor = .gray
        displayLabel.textAlignment = .right
        displayLabel.text = ""
        self.setUpLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpLayout(){
        self.setUpDisplay()
        self.setUpButtons()
    }

    private func setUpButtons(){
        for button in inputButtons{
            self.addSubview(button)
        }
    }

    private func setUpDisplay(){
        self.displayLabel.backgroundColor = .gray
        self.addSubview(displayLabel)
    }

    private func isOp(_ op:String) -> Bool{
        return op=="+" || op=="-" || op=="/" || op=="*" || op=="%" || op=="=" || op == "+/-" || op=="AC" || op=="."
    }

    @objc func inputNumber(_ sender:UIButton){
        if self.displayLabel.text?.count ?? -1 <= 0,  sender.title(for: .normal) ?? "" == "0"{
            return
        }
        if self.oldValue != nil &&  (self.oldValue ?? 0.0) == Double(self.displayLabel.text ?? "0.0") ?? 0.0{
            self.displayLabel.text = ""
        }
        self.displayLabel.text?.append(sender.title(for: .normal) ?? "")
        self.setUpDisplay()
    }

    @objc func inputOp(_ sender:UIButton){
        let currentOp = sender.title(for: .normal) ?? ""
        let currnetNumber = displayLabel.text ?? ""

        if currentOp == "AC" {
            displayLabel.text = ""
            newValue = nil
            oldValue = nil
            return
        }
        else if currentOp == "+/-" {
            oldValue = (Double(currnetNumber) ?? 0.0) * Double(-1)
            displayLabel.text = String(oldValue ?? 0.0)
            return
        }
        else if currentOp == "." {
            //float point ㄷㄷ
            return
        }

        if oldValue == nil {
            currentOperator = currentOp
            oldValue = Double(currnetNumber) ?? 0.0
            displayLabel.text = ""
            return
        }

        newValue = Double(currnetNumber) ?? 0.0
        if currentOp == "=" {
            if currentOperator == "+" {
                newValue = Double(currnetNumber) ?? 0.0
                oldValue = (oldValue ?? 0.0) + (newValue ?? 0.0)
                displayLabel.text = String(oldValue ?? 0.0)
            }
            else if currentOperator == "-" {
                newValue = Double(currnetNumber) ?? 0.0
                oldValue = (oldValue ?? 0.0) - (newValue ?? 0.0)
                displayLabel.text = String(oldValue ?? 0.0)
            }
            else if currentOperator == "*" {
                newValue = Double(currnetNumber) ?? 0.0
                oldValue = (oldValue ?? 0.0) * (newValue ?? 0.0)
                displayLabel.text = String(oldValue ?? 0.0)
            }
            else if currentOperator == "/" {
                newValue = Double(currnetNumber) ?? 0.0
                oldValue = (oldValue ?? 0.0) / (newValue ?? 0.0)
                displayLabel.text = String(oldValue ?? 0.0)
            }
            else if currentOperator == "%" {
                newValue = Double(currnetNumber) ?? 0.0
                oldValue = (oldValue ?? 0.0).remainder(dividingBy: newValue ?? 0.0)
                displayLabel.text = String(oldValue ?? 0.0)
            }
            newValue = nil
            oldValue = nil
        }

        else if currentOperator == "+" || currentOperator == "-"  || currentOperator == "*" || currentOperator == "/" || currentOperator == "%" {
            oldValue = calcOper(number1: oldValue, number2: newValue, op: currentOperator)
            displayLabel.text = String(oldValue ?? 0.0)
            newValue = nil
        }

        currentOperator = currentOp
    }

    func calcOper(number1 num1:Double?, number2 num2:Double?, op oper:String) -> Double?{
        var ret: Double? = nil
        var unwrapNum1: Double = 0.0
        var unwrapNum2: Double = 0.0

        if let tmp1 = num1 , let tmp2 = num2{
            unwrapNum1 = tmp1
            unwrapNum2 = tmp2
        }

        if oper == "+" {
            ret = unwrapNum1 + unwrapNum2
        }
        else if oper == "-" {
            ret = unwrapNum1 - unwrapNum2
        }
        else if oper == "*" {
            ret = unwrapNum1 * unwrapNum2
        }
        else if oper == "/" {
            ret = unwrapNum1 / unwrapNum2
        }
        else if oper == "%" {
            ret = unwrapNum1.remainder(dividingBy: unwrapNum2)
        }

        return ret
    }
}
