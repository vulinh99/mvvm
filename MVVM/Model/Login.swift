//
//  Login.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 04/06/2021.
//

import Foundation
class datalogin{
    private static var sharedDataManager: datalogin = {
        let dataManager = datalogin()
        return dataManager
    }()
    
    class func shared() -> datalogin {
        return sharedDataManager
    }
    
    // init
    private init() {}
    
    //open database
    func set() -> (String, String) {
        let email = UserDefaults.standard.string(forKey: "txtEmail") ?? ""
        
        let password = UserDefaults.standard.string(forKey: "txtPassword") ?? ""
        return (email,password)
    }
    
    //save database
    func save(email: String,password: String) {
        UserDefaults.standard.set(email, forKey: "txtEmail")
        UserDefaults.standard.set(password, forKey: "txtPassword")
        UserDefaults.standard.synchronize()
    }
}
