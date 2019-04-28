//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Alexis Veliz on 4/27/19.
//  Copyright © 2019 Alexis Veliz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inputText : String = ""
    var percentValue : Float = 0.0
    var billAmount: Float = 0.0
    //var valueEntered : Double = 0.00
    
    let buttonTags = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
    
    @IBOutlet var amountEntered: UITextField!
    @IBOutlet var tipPercentage: UITextField!
    @IBOutlet var tipOutput: UITextField!
    
    @IBOutlet var totalOutput: UITextField!
    
    @IBOutlet var tipSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(sender.tag == 11){
            if(inputText.count == 0){   // Prevent Fatal Error
                inputText = ""
            }
            else{
                inputText.removeLast()
            }
        }
            
        else{
            inputText += buttonTags[sender.tag]
        }
        
        amountEntered.text = inputText
        //var valueEntered = (inputText as NSString).doubleValue
        billAmount = (inputText as NSString).floatValue
        print(billAmount)
        evaluateTotal(tip: evaluateTip())
    }
    
    
    @IBAction func sliderMoves(_ sender: UISlider){
        percentValue = sender.value
        tipPercentage.text = String(percentValue) + "%"
        evaluateTotal(tip: evaluateTip())
    }
    
    func evaluateTip()-> Float{
        var tip = billAmount * (percentValue / 100)
        tipOutput.text = stringToCurrency(totalAmount: tip)
        return tip
    }
    
    func evaluateTotal(tip : Float){
        var totalAmount = tip + billAmount
        print(totalAmount)
        
        totalOutput.text = stringToCurrency(totalAmount: totalAmount)
    }
    
    func stringToCurrency(totalAmount : Float)->String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        // We'll force unwrap with the !, if you've got defined data you may need more error checking
        let priceString = currencyFormatter.string(from: NSNumber(value: totalAmount))!
        return priceString
    }
    
}

