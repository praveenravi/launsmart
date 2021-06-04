//
//  TC.swift
//  LaunSmart
//
//  Created by apple on 17/03/21.
//

import UIKit

class TC: UITabBarController {

    // MARK: - Object Cycle
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    class func instance() -> TC {
        let thisStoryboard = UIStoryboard(name: "TabsSt", bundle: nil)
        let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "TC") as! TC
        return thisVC
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectedIndex = 1
        // Do any additional setup after loading the view.
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
