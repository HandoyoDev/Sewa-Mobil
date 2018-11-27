//
//  CellSideMenu.swift
//  Sewa Mobil
//
//  Created by Handoyo on 25/10/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import UIKit

class CellSideMenu: UITableViewCell {

    @IBOutlet weak var imageSideMenu: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(_ url: URL){
        getDataFromUrl(url: url) { (data, response, error)  in
            DispatchQueue.main.async { () -> Void in
                guard let data = data, error == nil
                    else {
                        return
                }
                self.imageSideMenu.image = UIImage(data: data)
            }
        }
    }

}
