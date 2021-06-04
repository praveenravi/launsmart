//
//  MobileLoginVC.swift
//  LaunSmart
//
//  Created by apple on 16/03/21.
//

import UIKit

class MobileLoginVC: UIViewController {
    @IBOutlet weak var textfield : UITextField?
    @IBOutlet weak var getOtpButton : UIButton!
    @IBOutlet weak var countryCodeLabel : UILabel?
    // MARK: - Object Cycle
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    class func instance() -> MobileLoginVC {
        let thisStoryboard = UIStoryboard(name: "LoginSt", bundle: nil)
        let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "MobileLoginVC") as! MobileLoginVC
        return thisVC
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func pageSubmitAction(sender : AnyObject)
    {
        self.gotoOtpView()
    }
    func gotoOtpView()
    {
        let otpinstance = MobileLoginOTPVC.instance()
        self.navigationController?.pushViewController(otpinstance, animated: true)
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
