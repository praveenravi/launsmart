//
//  MobileLoginPersonalInfo.swift
//  LaunSmart
//
//  Created by apple on 17/03/21.
//



    import UIKit

    class MobileLoginPersonalInfo: UIViewController {
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
        class func instance() -> MobileLoginPersonalInfo {
            let thisStoryboard = UIStoryboard(name: "LoginSt", bundle: nil)
            let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "MobileLoginPersonalInfo") as! MobileLoginPersonalInfo
            return thisVC
        }
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        @IBAction func pageSubmitAction(sender : AnyObject)
        {
           self.gotoDashBoard()
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
