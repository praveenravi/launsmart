//
//  MapSearchVC.swift
//  LaunSmart
//
//  Created by apple on 26/03/21.
//

import UIKit

class MapSearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    class func instance() -> MapSearchVC {
        let thisStoryboard = UIStoryboard(name: "MapSt", bundle: nil)
        let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "MapSearchVC") as! MapSearchVC
        return thisVC
    }
    @IBAction func BackButtonPressed(sender : AnyObject)
    {
        self.navigationController?.popViewController(animated: true)
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
