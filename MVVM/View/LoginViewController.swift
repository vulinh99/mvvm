//
//  LoginViewController.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 04/06/2021.
//

import UIKit

class LoginViewController: ViewController {
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    var viewloginModel = LoginViewModel(email: "sdfsdf", password: "abcd")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatate()

        // Do any additional setup after loading the view.
    }
    override func setupRegister() {
        super.setupRegister()
        self.title = "Login"
        updatate()
    }
    
    override func setupDat() {
        
    }
    
    
    
    func updatate(){
        txtEmail.text = viewloginModel.email
        txtPass.text = viewloginModel.password
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btn_clcik(_ sender: Any) {
        let email = txtEmail?.text ?? ""
        let password = txtPass?.text ?? ""
        
        let complete:LoginViewModel.Completion = { (result) in
            switch result {
            case.successfully:
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "HOME") as! HomeViewController
                self.navigationController?.pushViewController(vc, animated: true)
                print("login successfully")
            case .failure(let error,let errMess):
                if error{
                    print(" login failed")
                    print(errMess)
                }
            }
            
        }
        viewloginModel.Login(email: email, password: password, completion: complete)
    }
    
    @IBAction func btn_rigister(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "REGISTER") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
