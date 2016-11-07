//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Student on 2016-11-06.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myImageView: UIImageView!
    let pickerData = ["Rock","Paper","Scissors"]
    let pickerValues = [#imageLiteral(resourceName: "rock.jpg"),#imageLiteral(resourceName: "paper.jpg"),#imageLiteral(resourceName: "scissors.jpg")]
    var selectedRow : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.dataSource = self
        myPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myImageView.image = pickerValues[row]
        selectedRow = row
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        let aiChoice = Int(arc4random_uniform(3))
        var message : String = ""
        if(aiChoice == 0){
            message = "AI chose Rock!"
            if(selectedRow == 0){
                message += "\rYou chose Rock!"
                message += "\rIt's a tie!"
            }
            else if(selectedRow == 1){
                message += "\rYou chose Paper!"
                message += "\rYou win!"
            }
            else{
                message += "\rYou chose Scissors!"
                message += "\rYou lose!"
            }
        }
        else if(aiChoice == 1){
            message = "AI chose Paper!"
            if(selectedRow == 0){
                message += "\rYou chose Rock!"
                message += "\rYou lose!"
            }
            else if(selectedRow == 1){
                message += "\rYou chose Paper!"
                message += "\rIt's a tie!"
            }
            else{
                message += "\rYou chose Scissors!"
                message += "\rYou win!"
            }
        }
        else if(aiChoice == 2){
            message = "AI chose Scissors!"
            if(selectedRow == 0){
                message += "\rYou chose Rock!"
                message += "\rYou win!"
            }
            else if(selectedRow == 1){
                message += "\rYou chose Paper!"
                message += "\rYou lose!"
            }
            else{
                message += "\rYou chose Scissors!"
                message += "\rIt's a tie!"
            }
        }
        
        myLabel.text = message
    }
    
}

