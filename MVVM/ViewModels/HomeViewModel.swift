//
//  HomeViewModel.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 04/06/2021.
//

import Foundation
class HomeViewModel{
    var email:String = ""
    var sdt:String = ""
    var password:String = ""
    var confirmpassword:String = ""
    
    func fetchdata(completion:(Bool,String,String,String,String) -> ()){
        let data = DataUser.shared().set()
        let email = data.0
        let sdt = data.1
        let password =  data.2
        let confirmpassword = data.3
        
        // luu data
        if email != "" || sdt != "" || password != "" || confirmpassword != "" {
            self.email = email
            self.sdt = sdt
            self.password = password
            self.confirmpassword = confirmpassword
            
            completion(true,email,sdt,password,confirmpassword)
        }else{
            completion(false,"","","","")
        }
    
        
    }
    func fetchdataDNHAP(completion:(Bool,String,String) -> ()){
        let data = datalogin.shared().set()
        let email = data.0
        let password =  data.1
        
        
        // luu data
        if email != ""  || password != "" {
            
            self.email = email
           
            self.password = ""
            
            completion(true,email,password)
        }else{
            completion(false,"","")
        }
    
        
    }
}
