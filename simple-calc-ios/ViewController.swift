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
    var averageStorage = [Int]()
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
            averageStorage.append(num)
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
            else if operation == 17 {
                var sum = 0
                var result = 0;
                for num in averageStorage {
                    sum += num
        
                }
                result = sum / averageStorage.count
                // do if statement to store last num
                label.text = String(result)
            }
            
            else if operation == 18 {
                // Average count is the same funcatioanlity as average
                label.text = String(averageStorage.count)

            }
            else if operation == 19 {
                
                label.text = String()
            }
        }
        else if sender.tag == 11{
            label.text = ""
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
