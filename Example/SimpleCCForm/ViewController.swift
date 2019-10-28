//
//  ViewController.swift
//  SimpleCCForm
//
//  Created by Jean-Marc Boullianne on 10/27/2019.
//  Copyright (c) 2019 Jean-Marc Boullianne. All rights reserved.
//

import UIKit
import SimpleCCForm

class ViewController: UIViewController {

    let simpleCCForm = SimpleCCForm(frame: CGRect(x: 7, y: 50, width: 400, height: 600))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        view.addSubview(simpleCCForm)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

