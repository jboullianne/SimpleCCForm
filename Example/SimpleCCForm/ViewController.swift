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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = self.view.frame.width
        let simpleCCForm = SimpleCCForm(frame: CGRect(x: 10, y: 50, width: width - 20, height: 600))
        view.addSubview(simpleCCForm)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

