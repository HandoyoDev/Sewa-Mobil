//
//  ViewRegister.swift
//  Sewa Mobil
//
//  Created by Handoyo on 4/2/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewRegister: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelNama: UITextField!
    @IBOutlet weak var labelUsername: UITextField!
    @IBOutlet weak var labelEmail: UITextField!
    @IBOutlet weak var labelPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            //self.menuButton.target = self.revealViewController()
            //self.menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    @IBAction func goRegister(_ sender: Any) {
        DispatchQueue.main.async(execute: {
            let parameters = [
                "nama": self.labelNama.text!,
                "username": self.labelUsername.text!,
                "email": self.labelEmail.text!,
                "password": self.labelPassword.text!
            ]
            let appConfig : app_config = app_config()
            Alamofire.request(appConfig.getApiUrl(type: "register"), method: .post, parameters: parameters)
                .responseJSON { response in
                    if let value = response.result.value {
                        let json = JSON(value)
                        for item in json["result"].arrayValue {
                            if (item["code"].stringValue == "1")
                            {
                                let alertController = UIAlertController(title: "", message: item["info"].stringValue, preferredStyle: .alert)
                                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                                }
                                alertController.addAction(OKAction)
                                self.present(alertController, animated: true, completion:nil)
                            }
                            else
                            {
                                let alertController = UIAlertController(title: "", message: item["info"].stringValue, preferredStyle: .alert)
                                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                                }
                                alertController.addAction(OKAction)
                                self.present(alertController, animated: true, completion:nil)
                            }
                        }
                    }
            }
        })
    }
    
}
