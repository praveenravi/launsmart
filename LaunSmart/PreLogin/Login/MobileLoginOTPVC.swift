//
//  MobileLoginOTPVC.swift
//  LaunSmart
//
//  Created by apple on 16/03/21.
//

import UIKit

class MobileLoginOTPVC: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var textfield : UITextField?
    @IBOutlet weak var oTpButton1 : UIButton!
    @IBOutlet weak var oTpButton2 : UIButton!
    @IBOutlet weak var oTpButton3 : UIButton!
    @IBOutlet weak var oTpButton4 : UIButton!
    @IBOutlet weak var oTpButton5 : UIButton!
    @IBOutlet weak var resentOtpButton : UIButton!
    // MARK: - Object Cycle
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    class func instance() -> MobileLoginOTPVC {
        let thisStoryboard = UIStoryboard(name: "LoginSt", bundle: nil)
        let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "MobileLoginOTPVC") as! MobileLoginOTPVC
        return thisVC
    }

    func setOptView()
    {   textfield?.delegate = self
        resentOtpButton.setState(false)
        textfield?.keyboardType = .numberPad
        textfield?.becomeFirstResponder()
        oTpButton1.setTitle("", for: .normal)
        oTpButton2.setTitle("", for: .normal)
        oTpButton3.setTitle("", for: .normal)
        oTpButton4.setTitle("", for: .normal)
        oTpButton5.setTitle("", for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setOptView()
        // Do any additional setup after loading the view.
    }
    @IBAction func textFieldChanged(_ sender: UITextField) {
       
       
            if(sender.text?.count == 1)
            {
                let text = sender.text ?? ""
                let lastDigit = String(text.last!)
                oTpButton1.setTitle(lastDigit, for: .normal)
                
            }
            if(sender.text?.count == 2)
            {
                let text = sender.text ?? ""
                let lastDigit = String(text.last!)
                oTpButton2.setTitle(lastDigit, for: .normal)
            }
            if(sender.text?.count == 3)
            {
                let text = sender.text ?? ""
                let lastDigit = String(text.last!)
                oTpButton3.setTitle(lastDigit, for: .normal)
            }
            if(sender.text?.count == 4)
            {
                let text = sender.text ?? ""
                let lastDigit = String(text.last!)
                oTpButton4.setTitle(lastDigit, for: .normal)
            }
            if(sender.text?.count == 5)
            {
                let text = sender.text ?? ""
                let lastDigit = String(text.last!)
                oTpButton5.setTitle(lastDigit, for: .normal)
                //nextButton.setState(sender.hasText)
                self.gotoPersonalInfo()
            }
        
    }
    func gotoPersonalInfo()
    {
        let personalInfoInstance = MobileLoginPersonalInfo.instance()
        self.navigationController?.pushViewController(personalInfoInstance, animated: true)
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
