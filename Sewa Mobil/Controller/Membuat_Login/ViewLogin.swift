//
//  ViewLogin.swift
//  Sewa Mobil
//
//  Created by Handoyo on 3/28/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewLogin: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelEmail: UITextField!
    @IBOutlet weak var labelPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelEmail.delegate = self
        self.labelPassword.delegate = self
    }
    
    @IBAction func goLogin(_ sender: Any) {
        DispatchQueue.main.async(execute: {
            let parameters = [
                "email": self.labelEmail.text!,
                "password": self.labelPassword.text!
            ]
            let appConfig : app_config = app_config()
            Alamofire.request(appConfig.getApiUrl(type: "login"), method: .post, parameters: parameters)
                .responseJSON { response in
                    if let value = response.result.value {
                        let json = JSON(value)
                        for item in json["result"].arrayValue {
                            if (item["code"].stringValue == "1")
                            {
                                let alertController = UIAlertController(title: "", message: item["info"].stringValue, preferredStyle: .alert)
                                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                                    self.labelEmail.resignFirstResponder()
                                    self.labelPassword.resignFirstResponder()
                                }
                                alertController.addAction(OKAction)
                                self.present(alertController, animated: true, completion:nil)
                            }
                            else
                            {
                                let alertController = UIAlertController(title: "", message: item["info"].stringValue, preferredStyle: .alert)
                                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                                    self.labelEmail.resignFirstResponder()
                                    self.labelPassword.resignFirstResponder()
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
