//
//  DataRegister.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 03/06/2021.
//

import Foundation

class DataRegister {
    private static var InfoData: DataRegister = {
        let dataRegister = DataRegister()
        return dataRegister
    }()
    
    class func sharedata() -> DataRegister{
        return InfoData
    
    }
    private init(){
        
    }
    func set() -> (String,String,String,String){
        let email = UserDefaults.standard.string(forKey: "inputEmail") ?? ""
        let sdt = UserDefaults.standard.string(forKey: "inputSDT") ?? ""
        let password = UserDefaults.standard.string(forKey: "inputPassword") ?? ""
        let confirmpassword = UserDefaults.standard.string(forKey: "inputConfirmPassword") ?? ""
        return (email,sdt,password,confirmpassword)
    }
    
    func save(email:String,sdt:String,password:String,confirmpassword:String){
        UserDefaults.standard.setValue(email, forKey: "inputEmail")
        UserDefaults.standard.setValue(sdt, forKey: "inputSDT")
        UserDefaults.standard.setValue(password, forKey: "inputPassword")
        UserDefaults.standard.setValue(confirmpassword, forKey: "inputConfirmPassword")
        UserDefaults.standard.synchronize()
        
    }
}
