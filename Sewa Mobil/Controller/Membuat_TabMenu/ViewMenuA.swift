//
//  ViewMenuA.swift
//  Sewa Mobil
//
//  Created by Handoyo on 25/10/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import UIKit

class ViewMenuA: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
