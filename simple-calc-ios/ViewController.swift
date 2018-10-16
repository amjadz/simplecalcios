//
//  ViewController.swift
//  simple-calc-ios
//
//  Created by Zubair Amjad on 10/15/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var num = 0
    var previousSum =  0
    var operation = 0
    var math = false
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if math == true {
            label.text = String(sender.tag - 1)
            num = Int(label.text!)!
            math = false
            
        }
        else {
            label.text = label.text! + String(sender.tag - 1)
            num = Int(label.text!)!
            
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousSum = Int(label.text!)!
            
            if sender.tag == 12{ // Divide
                label.text = "/"
                
            }
            else if sender.tag == 13{ // Multiply
                label.text = "x"
                
            }
            else if sender.tag == 14{ // Subtract
                label.text = "-"
                
            }
            else if sender.tag == 15{ // Add
                label.text = "+"
                
            }
            else if sender.tag == 17{
                label.text = "avg"
                
            }
            else if sender.tag == 18 {
                label.text = "count"
                
            }
            else if sender.tag == 19 {
                label.text = "fact"
                
            }
            
            operation = sender.tag
            math = true
        }
        else if sender.tag == 16 {
            if operation == 12 {
                label.text = String(previousSum / num)
            }
            else if operation == 13 {
                label.text = String(previousSum * num)
            }
            else if operation == 14 {
                label.text = String(previousSum - num)
            }
            else if operation == 15 {
                label.text = String(previousSum + num)
                
            }
            
        }
        else if sender.tag == 11{
            label.text = "0"
            previousSum = 0
            num = 0
            operation = 0
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
