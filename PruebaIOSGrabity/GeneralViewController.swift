//
//  GeneralViewController.swift
//  PruebaIOSGrabity
//
//  Created by Pedro Alonso Daza Balaguera on 25/11/15.
//  Copyright © 2015 Pedro Alonso Daza Balaguera. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {

    @IBOutlet weak var lbInfo: UILabel!
    
    var Letrero = "";
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbInfo.text = Letrero
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
