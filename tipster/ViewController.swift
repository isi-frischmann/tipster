//
//  ViewController.swift
//  tipster
//
//  Created by Isabell Frischmann on 9/7/18.
//  Copyright © 2018 Isabell Frischmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    amountPercent: collection for the percentage per amount
//    totalValueWP: collection for the total amount incl. percentage and group size
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var changeGroupLabel: UILabel!
    @IBOutlet var percentageLabel: [UILabel]!
    @IBOutlet var amountPercent: [UILabel]!
    @IBOutlet var totalValueWP: [UILabel]!
    @IBOutlet weak var groupSizeSliderOutlet: UISlider!
    
    //    variables
    var isDecimal = "."
    
//    variables for the percentage default values (when slider is used)
    var defaultLowPercentage: Int = 5
    var defaultMiddlePercentage: Int = 10
    var defaultHighPercentage: Int = 15
    
//    variables for the changing amount when sliders are used
    var percentageLowValue: Double = 0.00
    var percentageMiddleValue: Double = 0.00
    var percentageHighValue: Double = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountLabel.text = "\(0.0)"
        updateAmount()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //    numbers are pressed
    @IBAction func numberPressed(_ sender: UIButton) {
//        print("Number button is pressed -> sender.tag", sender.tag)
//        check if amount is 0.0 as amount is set to 0 when the clear button was pressed
        if amountLabel.text == "0.0" {
            amountLabel.text = ""
//            print("That's the sender after clearing", sender.tag)
        }
        if sender.tag <= 9 {
            amountLabel.text = amountLabel.text! + "\(sender.tag)"
        }
        if sender.tag == 10 {
            sender.tag = 0
            amountLabel.text = amountLabel.text! + "\(sender.tag)"
        }
        updateAmount()
    }
    
//    CLEAR
    @IBAction func clearPressed(_ sender: UIButton) {
        amountLabel.text = "\(0.0)"
    }
    
//    DOT
    @IBAction func dotPressed(_ sender: UIButton) {
//        print("Dot pressed: ", sender.tag)
        amountLabel.text = amountLabel.text! + isDecimal
    }
    
//    updateAmount
    func updateAmount() {
        
//        show the default percentage label on the top (percentageLabel is the collection from the Labels)
        percentageLabel[0].text = "\(defaultLowPercentage)%"
        percentageLabel[1].text = "\(defaultMiddlePercentage)%"
        percentageLabel[2].text = "\(defaultHighPercentage)%"
        
//        if slider is used change the amount on top
        amountPercent[0].text = "0.00"
        amountPercent[1].text = "0.00"
        amountPercent[2].text = "0.00"
        
//      Transform String(Label) and variable(Int) into DOUBLEs
        var total = Double(amountLabel.text!)
        var lowTipDouble = Double(defaultLowPercentage)
        var middleTipDouble = Double(defaultMiddlePercentage)
        var highTipDouble = Double(defaultHighPercentage)
        var groupSize = Double(groupSizeSliderOutlet.value)

        let lowTip = total! * (lowTipDouble) / 100
        let middleTip = total! * (middleTipDouble) / 100
        let highTip = total! * (highTipDouble) / 100
    
        amountPercent[0].text = "\((lowTip) / groupSize.rounded(.down))"
        amountPercent[1].text = "\((middleTip) / groupSize.rounded(.down))"
        amountPercent[2].text = "\((highTip) / groupSize.rounded(.down))"
        
//        Slider for total Amount incl. Percentage
        totalValueWP[0].text = "\((total! + lowTip) / groupSize.rounded(.down))"
        totalValueWP[1].text = "\((total! + middleTip) / groupSize.rounded(.down))"
        totalValueWP[2].text = "\((total! + highTip) / groupSize.rounded(.down))"
        
        var amountWithPercentage =
        print("That's the amount Label: ", amountLabel.text, "That's the amountPercent")
        
    }
    
    
    @IBAction func tipSlider(_ sender: UISlider) {
        defaultLowPercentage = Int(sender.value)
        defaultMiddlePercentage = Int(sender.value)  + 5
        defaultHighPercentage = Int(sender.value) + 10
        
        updateAmount()
    }
    
//    moving group slider
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        print("Sender.value is a float: ", sender.value)
        var intValueGroup = Int(sender.value)
        changeGroupLabel.text = "Group Size: \(intValueGroup)"
//        print("Inside the group size", groupSizeSlider)
        
        updateAmount()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

