//
//  InitialViewController.swift
//  7ca
//
//  Created by Ivana  on 14.7.21.
//  Copyright © 2021 Martin Anchevski. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet weak var odiNaMeni: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        odiNaMeni.layer.cornerRadius = 25
        odiNaMeni.layer.borderWidth = 2
        odiNaMeni.layer.borderColor = UIColor.lightGray.cgColor
    }
        // Do any additional setup after loading the view.
    @IBAction func TapedButton(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
