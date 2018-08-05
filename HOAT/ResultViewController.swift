//
//  ResultViewController.swift
//  HOAT
//
//  Created by mordred on 10.05.2018.
//  Copyright © 2018 Fungames. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultString: String = ""

    @IBOutlet weak var resultStringLabel: UILabel!
    
    @IBOutlet weak var tryAgainBtnLabel: UIButton!
    
    @IBAction func tryAgainBtn(_ sender: UIButton) {
        // restart game
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tryAgainBtnLabel.layer.cornerRadius = 10
        tryAgainBtnLabel.clipsToBounds = true
        resultStringLabel?.text = resultString + " Second"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
