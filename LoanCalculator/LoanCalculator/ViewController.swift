//
//  ViewController.swift
//  LoanCalculator
//
//  Created by Ziyu Fu on 4/22/17.
//  Copyright © 2017 Ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   //inputs
    @IBOutlet weak var interestInput: UITextField!
    @IBOutlet weak var periodInput: UITextField!
    @IBOutlet weak var principalInput: UITextField!
    @IBOutlet weak var salvageInput: UITextField!
    @IBOutlet weak var timeSwitch: UISwitch!
    
    //outputs
    @IBOutlet weak var paymentPerMonthOutput: UILabel!
    @IBOutlet weak var paymentTotalOutput: UILabel!
    @IBOutlet weak var interestTotalOutput: UILabel!
    @IBOutlet weak var interestRateOutput: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        paymentPerMonthOutput.text = nil
        interestRateOutput.text = nil
        paymentTotalOutput.text = nil
        interestTotalOutput.text = nil
    }
    

    
    @IBAction func calculateOnTap(_ sender: UIButton) {
        
        //declarations
        let interest = Double(interestInput.text!)! / 1200
        let nper = Double(periodInput.text!)!
        let PV = Double(principalInput.text!)!
        let FV = Double(salvageInput.text!)!
        
        let paymentPerMonth:Double
        let paymentTotal:Double
        let interestTotal:Double
        let interestRate:Double
        
        //等额每期还款额
        
        if timeSwitch.isOn == false{
            paymentPerMonth = (PV * interest * pow((1 + interest), nper) / (pow((1 + interest), nper) - 1) + interest / (pow((1 + interest), nper) - 1) * FV)
        }else{
            paymentPerMonth = (PV * interest * pow((1 + interest), nper) / (pow((1 + interest), nper) - 1) + interest / (pow((1 + interest), nper) - 1) * FV) * (1 / (interest + 1))
        }
        
        paymentPerMonthOutput.text = String(format: "%.2f", paymentPerMonth)
        
        //等额还款总额
        paymentTotal = paymentPerMonth * nper
        paymentTotalOutput.text = String(format: "%.2f", paymentTotal)
        
        //总利息
        interestTotal = paymentTotal - PV
        interestTotalOutput.text = String(format: "%.2f", interestTotal)

        //客户标称利息
        interestRate = (interestTotal / 3 / PV) * 100
        interestRateOutput.text = String(format: "%.2f", interestRate)
        
    }

}

