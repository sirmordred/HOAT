//
//  ViewController.swift
//  HOAT
//
//  Created by mordred on 9.05.2018.
//  Copyright © 2018 Fungames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying: Bool = false;
    
    var resultTimeStr: String = ""
    
    var firstNum: Int = 1
    
    var nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func handleClick(_ sender: UIButton) {
        // handle click with sender.tag
        let indice: Int = sender.tag - 1 // we put tags to all buttons as (btnText + 1) so to gain real indice/button substract 1 from tag
        if (Int(nums[indice]) == firstNum) {
            nums[indice] = " "
            remapBtnLabels()
            if (firstNum == 1) {
                if (!isPlaying) {
                    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
                    isPlaying = true
                }
            } else if (firstNum == 18) {
                if (isPlaying) {
                    timer.invalidate() // pause timer
                    isPlaying = false
                    resultTimeStr = String(format: "%.1f", counter)
                    // switch to ResultViewController in here and pass 'resultTimeStr' string
                    self.performSegue(withIdentifier: "mySeg", sender: nil)
                }
            }
            firstNum += 1
        }
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.1 // update counter since we initialized timer as 0.1 interval
    }
    
    func remapBtnLabels() {
        nums.shuffle()
        for (index, btn) in buttons.enumerated() {
            btn.setTitle(nums[index], for: UIControlState.normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        remapBtnLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? ResultViewController
        {
            vc.resultString = resultTimeStr
        }
    }

}

