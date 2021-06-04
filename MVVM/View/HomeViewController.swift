//
//  HomeViewController.swift
//  MVVM
//
//  Created by Phùng Ngọc Vũ Linh on 04/06/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    var viewHomeModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        
    fetdata()
        fetdatadnhap()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        lbl.text = viewHomeModel.email
    }
    
    
    func fetdata(){
        viewHomeModel.fetchdata { done, email, sdt, password, confirmpassword in
            if done{
                self.updateUI()
            }else{
                print("loi")
        }
    }
}
    func fetdatadnhap(){
        viewHomeModel.fetchdataDNHAP { done, email, password  in
            if done{
                self.updateUI()
            }else{
                print("loi")
        }
            
    }
 }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
