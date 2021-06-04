//
//  ViewController.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 03/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtSDT: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    
    var viewModelRegister = UserRegiterViewModel(email: "linh", sdt: "0936772170", password: "123", confirmpassword: "123")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtUsername?.text = viewModelRegister.inputEmail
        txtSDT?.text = viewModelRegister.inputSDT
        txtPassword?.text = viewModelRegister.inputPassword
        txtConfirmPassword?.text = viewModelRegister.inputConfirmPassword
    }
    
    func setupRegister(){
        self.title = "Register"
        update()
    }
    
    func setupDat(){
        
    }
    
    
    
    func update(){
        txtUsername?.text = viewModelRegister.inputEmail
        txtSDT?.text = viewModelRegister.inputSDT
        txtPassword?.text = viewModelRegister.inputPassword
        txtConfirmPassword?.text = viewModelRegister.inputConfirmPassword
    }


    @IBAction func btn_Register(_ sender: Any) {
        let email = txtUsername.text ?? ""
        let sdt = txtSDT.text ?? ""
        let password = txtPassword.text ?? ""
        let confirmpassword = txtConfirmPassword.text ?? ""
        
        let complete:UserRegiterViewModel.Completion = { (result) in
            switch result {
            case.success:
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "HOME") as! HomeViewController
                self.navigationController?.pushViewController(vc, animated: true)
                print("resister successfully")
            case .failure(let error,let errMess):
                if error{
                    print("resister failed")
                    print(errMess)
                }
            }
            
        }
        viewModelRegister.Register(email: email, sdt: sdt, password: password, confirmpassword: confirmpassword, completion: complete)
    }
}



