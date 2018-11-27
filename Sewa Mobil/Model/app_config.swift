//
//  app_config.swift
//  Sewa Mobil
//
//  Created by Handoyo on 28/08/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import Foundation

class app_config {
    let BASE_URL_SEWA: NSString = "http://localhost/sewamobil/"
    func getApiUrl(type : String) -> String
    {
        var newUrl : String = ""
        switch type {
            case "login"  :
                newUrl = (BASE_URL_SEWA as String) + "api/login.php"
                break
            case "mobil"  :
                newUrl = (BASE_URL_SEWA as String) + "api/mobil.php"
                break
            case "register"  :
                newUrl = (BASE_URL_SEWA as String) + "api/register.php"
                break
            case "sidemenu"  :
                newUrl = (BASE_URL_SEWA as String) + "api/sidemenu.php"
                break
            default: break
        }
        return (newUrl as NSString) as String
    }
}
