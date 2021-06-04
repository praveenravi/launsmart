//
//  BaseVC.swift
//  LaunSmart
//
//  Created by apple on 16/03/21.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userDefault = UserDefaults.standard
        let accessToken = userDefault.value(forKey: "ACCESS_TOKEN") as? String
        if (accessToken != nil){
            self.gotoDashBoard()
        }else{
            self.gotoLogin()
        }
    }
    func gotoLogin()
    {
        let loginInstance = MobileLoginVC.instance()
        self.navigationController?.pushViewController(loginInstance, animated: true)
    }
    func gotoDashBoard()
    {
        let tcInstance = TC.instance()
        self.navigationController?.pushViewController(tcInstance, animated: true)
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
