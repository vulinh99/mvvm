//
//  Model.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 04/06/2021.
//

import Foundation
class DataUser {
    
    //singleton
    private static var sharedDataManager: DataUser = {
        let dataManager = DataUser()
        return dataManager
    }()
    
    class func shared() -> DataUser {
        return sharedDataManager
    }
    
    // init
    private init() {}
    
    //open database
    func set() -> (String, String,String,String) {
        let email = UserDefaults.standard.string(forKey: "inputEmail") ?? ""
        let sdt = UserDefaults.standard.string(forKey: "inputSDT") ?? ""
        let password = UserDefaults.standard.string(forKey: "inputPassword") ?? ""
        let confirmpassword = UserDefaults.standard.string(forKey: "inputConfirmPassword") ?? ""
        return (email,sdt,password,confirmpassword)
    }
    
    //save database
    func save(email: String,sdt:String,password: String,confirmpassword:String) {
        UserDefaults.standard.set(email, forKey: "inputEmail")
        UserDefaults.standard.set(sdt, forKey: "inputSDT")
        UserDefaults.standard.set(confirmpassword, forKey: "inputConfirmPassword")
        UserDefaults.standard.set(password, forKey: "inputPassword")
        UserDefaults.standard.synchronize()
    }
}
