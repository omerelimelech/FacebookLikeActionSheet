//
//  ViewController.swift
//  FacebookLikeActionSheet
//
//  Created by Omer Elimelech on 4/28/19.
//  Copyright © 2019 Omer Elimelech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        guard let actionVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActionTableViewController") as? ActionSheetViewController else {return}
        
        
        self.present(actionVc, animated: true, completion: nil)
    }
    
}

