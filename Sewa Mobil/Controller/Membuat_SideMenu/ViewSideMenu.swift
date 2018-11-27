//
//  ViewSideMenu.swift
//  Sewa Mobil
//
//  Created by Handoyo on 25/10/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewSideMenu: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrDict :NSMutableArray=[]
    @IBOutlet weak var tvJSON: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let uc = UITableViewCell()
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1")!
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2")!
            return cell
        }
        return uc
    }
}
