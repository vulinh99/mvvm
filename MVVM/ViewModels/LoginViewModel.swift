//
//  LoginViewModel.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 04/06/2021.
//

import Foundation
class LoginViewModel{
    var email:String = ""
    var password:String = ""
    
    init(email:String,password:String){
        self.email = email
        self.password = password
        
    }
    enum LoginResult {
        case successfully
        case failure(Bool, String)
    }
    typealias Completion = (LoginResult) -> Void
    
    func fetchdata(completion:(Bool,String,String) -> ()){
        let data = datalogin.shared().set()
        let email = data.0
        
        let password =  data.1
        
        
        // luu data
        if email != "" ||  password != ""  {
            self.email = email
            self.password = password
            
           
            
            completion(true,email,password)
        }else{
            completion(false,"","")
        }
    
        
    }
    
    func Login(email:String,password:String,completion:Completion){
        if email == "" || password == "" {
            completion(.failure(true, " rong"))
        }
        else{
            self.email = email
            
            self.password = password
            
            
            datalogin.shared().save(email: email, password: password)
            
            completion(.successfully)
        }
    }
}
