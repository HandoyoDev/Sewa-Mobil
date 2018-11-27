//
//  CellMobil.swift
//  Sewa Mobil
//
//  Created by Handoyo on 3/29/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import UIKit

class CellMobil: UITableViewCell {

    @IBOutlet weak var imageMobil: UIImageView!
    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelNopol: UILabel!
    @IBOutlet weak var labelHarga: UILabel!
    @IBOutlet weak var labelJumlah: UILabel!
    @IBOutlet weak var labelSupir: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
                self.imageMobil.image = UIImage(data: data)
            }
        }
    } 
}
