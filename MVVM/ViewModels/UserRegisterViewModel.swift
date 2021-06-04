//
//  UserRegisterViewModel.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 03/06/2021.
//

import Foundation

class UserRegiterViewModel{
    var inputEmail:String = "abc"
    var inputSDT:String = "ass"
    var inputPassword:String = "asb"
    var inputConfirmPassword:String = "asb"
    
    init(email:String,sdt:String,password:String,confirmpassword:String){
        self.inputEmail = email
        self.inputSDT = sdt
        self.inputPassword = password
        self.inputConfirmPassword = confirmpassword
  
   
    }
    enum RegisterResult {
        case success
        case failure(Bool, String)
    }
    typealias Completion = (RegisterResult) -> Void
    
    func Register(email:String, sdt:String,password:String,confirmpassword:String, completion:Completion){
        if email == "" || sdt == "" || password == "" || confirmpassword == ""{
            completion(.failure(true, "Moi thu rong"))
        }else if(password != confirmpassword){
            completion(.failure(true, "Mat khau khong giong nhau"))
            
        }
        else{
            self.inputEmail = email
            self.inputSDT = sdt
            self.inputPassword = password
            self.inputConfirmPassword = confirmpassword
            
            DataUser.shared().save(email: email, sdt: sdt, password: password, confirmpassword: confirmpassword)
            
            completion(.success)
        }
        
    }
}
    
