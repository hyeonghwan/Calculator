//
//  ViewController.swift
//  Calculator
//
//  Created by 박형환 on 2021/11/07.
//

import UIKit

enum Operation {
    case Add
    case Substract
    case Multiply
    case Divide
    case unknown
}


class ViewController: UIViewController {

    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    
    var displayNumber: String = ""
    var firstNumber: String = ""
    var secondNumber: String = ""
    var resultNumber: String = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction func acBtnClick(_ sender: UIButton) {
        print("ac 클릭")
        self.displayNumber = ""
        self.resultNumber = ""
        self.firstNumber = ""
        self.secondNumber = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = self.displayNumber
  
    }
    
    @IBAction func ddd(_ sender: UIButton) {
       
        guard let d = sender.title(for: .normal) else {return}
        print(d)
    }
    @IBAction func numberClick(_ sender: UIButton) {
        print("0 클릭")
        guard let number = sender.titleLabel?.text else {return}
        if self.displayNumber.count < 9{
            self.displayNumber += number
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func dot_BtnClick(_ sender: UIButton) {
        guard let number = self.numberOutputLabel.text else{return}
        if !number.contains("."){
            if self.displayNumber.isEmpty{
                self.displayNumber += "0."
                self.numberOutputLabel.text = self.displayNumber
            }else{
                self.displayNumber += "."
                self.numberOutputLabel.text = self.displayNumber
            }
           
        }
    }
    @IBAction func operatorClick(_ sender: UIButton) {
        switch sender.titleLabel?.text
        {
        case "%":
            self.operation(.Divide)
        case "X":
            self.operation(.Multiply)
        case "+":
            self.operation(.Add)
        case "-":
            self.operation(.Substract)
        case "=":
            self.operation(self.currentOperation)
        default:
            return
        }
}
    func operation(_ operation: Operation ){
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty{
                print("안비워짐")
                self.secondNumber = self.displayNumber
                self.displayNumber = ""
                guard let first = Double(self.firstNumber) else {return}
                guard let second = Double(self.secondNumber) else {return}
                
                switch self.currentOperation{
                case .Divide:
                    self.resultNumber = "\(first / second)"
                case .Multiply:
                    self.resultNumber = "\(first * second)"
                case .Add:
                    self.resultNumber = "\(first + second)"
                case .Substract:
                    self.resultNumber = "\(first - second)"
                default:
                    break
                }
//                let result = Double(self.resultNumber)! - Double(Int(Double(self.resultNumber)!))
//                if result > 0 {
//                    self.firstNumber = self.resultNumber
//                    self.numberOutputLabel.text = self.firstNumber
//                } else {
//                    self.firstNumber = self.resultNumber
//                    self.numberOutputLabel.text = String(Int(Double(self.firstNumber)!))
//                }
               
                if let result = Double(self.resultNumber), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.resultNumber = String(Int(result))
                }
                self.firstNumber = self.resultNumber
                self.numberOutputLabel.text = self.firstNumber
            }
            self.currentOperation = operation
        }else {
            self.firstNumber = self.displayNumber
            self.currentOperation = operation
            
            self.displayNumber = ""
        }
    }
}

