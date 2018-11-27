//
//  ViewMobil.swift
//  Sewa Mobil
//
//  Created by Handoyo on 3/29/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewMobil: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrDict :NSMutableArray=[]
    @IBOutlet weak var tvJSON: UITableView!
    @IBOutlet var load: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async(execute: {
            if self.revealViewController() != nil {
                self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            }
            self.load.isHidden = false
            self.load.startAnimating()
            let parameters = [
                "token": ""
            ]
            let appConfig : app_config = app_config()
            Alamofire.request(appConfig.getApiUrl(type: "mobil"), method: .post, parameters: parameters)
                .responseJSON { response in
                    
                    if (response.result.value == nil) {
                        self.load.isHidden = true
                        self.load.stopAnimating()
                        
                        let alertController = UIAlertController(title: "", message: "Server / Jaringan Error", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                        }
                        alertController.addAction(OKAction)
                        self.present(alertController, animated: true, completion:nil)
                    }
                    
                    if let value = response.result.value {
                        let json = JSON(value)
                        if json["result"].arrayObject != nil {
                            self.arrDict.removeAllObjects()
                            if let past : NSArray = json["result"].arrayObject as NSArray? {
                                print(past)
                                for i in 0 ..< (json["result"].arrayObject! as NSArray).count
                                {
                                    self.arrDict.add((json["result"].arrayObject! as NSArray) .object(at: i))
                                }
                            }
                            self.tvJSON.reloadData()
                        }
                        self.load.isHidden = true
                        self.load.stopAnimating()
                    }
            }
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : CellMobil! = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CellMobil
        if let nama_mobil : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "nama_mobil") as? NSString {
            let nopol : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "no_polisi") as! NSString
            let harga : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "harga") as! NSString
            let jumlah : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "jumlah") as! NSString
            let supir : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "supir") as! NSString
            let image : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "foto") as! NSString
            cell.labelNama.text = nama_mobil as String
            cell.labelNopol.text = nopol as String
            cell.labelHarga.text = harga as String
            cell.labelJumlah.text = jumlah as String
            cell.labelSupir.text = supir as String
            cell.downloadImage(URL(string: image as String)!)
        } else {
            cell.labelNama.text = ""
            cell.labelNopol.text = ""
            cell.labelHarga.text = ""
            cell.labelJumlah.text = ""
            cell.labelSupir.text = ""
        }
        return cell as CellMobil
    }
}
