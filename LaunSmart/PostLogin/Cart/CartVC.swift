//
//  CartVC.swift
//  LaunSmart
//
//  Created by apple on 24/03/21.
//

import UIKit

    class CartVC: UIViewController {
        @IBOutlet weak var tableviewObj : UITableView?
        var itemsSelected = false
        var cartItemss = [Items]()
        internal required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        }
        class func instance() -> CartVC {
            let thisStoryboard = UIStoryboard(name: "CartSt", bundle: nil)
            let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "CartVC") as! CartVC
            return thisVC
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.registerTableCells()
            cartItemss = CartManager.shared.getAllItem() ?? [Items]()
            tableviewObj?.delegate = self
            tableviewObj?.dataSource = self
            // Do any additional setup after loading the view.
        }
       
        // Register TableViewCells
        let cellIds = ["NavigationHeaderCell","PaynowButtonCell","ChoosedServiceCell","ItemsTotalSummaryCell","PickupInfoCell","FranchiseHeaderCell", "PickupTimeInfoCell"]
        func registerTableCells(){
            for cellId in cellIds{
                self.tableviewObj?.register(UINib(nibName: cellId, bundle: Bundle.main), forCellReuseIdentifier: cellId)
            }
        }
        func gotoPaymentMethodPage()
        {
            let detailPageInstance = PaymentMethodsVC.instance()
            self.navigationController?.pushViewController(detailPageInstance, animated: true)
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
    extension CartVC : UITableViewDelegate
    {
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if(section == 0)
            {
                return 0.0
            }
            if(section == 1)
            {
                return 40.0
            }
            else if(section == 2)
            {
                return 40.0
            }
            else if(section == 3)
            {
                return 40.0
            }
           else if(section == 4)
            {
            return 0
            }
           else if(section == 5)
            {
            return 0
            }
           
            else
            {
                return 0.0
            }
           // return 0.0
        }
        
        
    }
    extension CartVC : UITableViewDataSource
    {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if(section == 0)
            {
                return 1
            }
            if(section == 1)
            {
                return 1
            }
            else if (section == 2)
            {
                return 1
            }
            else if (section == 3)
            {
                return 1
            }
            else if (section == 4)
            {
                return 1
            }
            else if (section == 5)
            {
                return 1
            }
            
            else
            {
                return 0
            }
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 6
        }
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
            let headerView = UIView()
                    let headerCell = tableviewObj!.dequeueReusableCell(withIdentifier: "FranchiseHeaderCell") as! FranchiseHeaderCell
            if(section == 0)
            {
            }
            if(section == 1)
            {
                headerCell.setSectionHeaderText(title: "PICK UP ADDRESS")
            }
            if(section == 2)
            {
                headerCell.setSectionHeaderText(title: "PICK UP TIME")
            }
            if(section == 3)
            {
                headerCell.setSectionHeaderText(title: "CHOOSED SERVICE")
            }
            if(section == 4)
            {
               
            }
            if(section == 5)
            {
                
            }
            
            headerView.addSubview(headerCell)
                    return headerView
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
            if(indexPath.section == 0)
            {
                let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "NavigationHeaderCell", for: indexPath) as? NavigationHeaderCell
                fcell?.title?.text = "Cart"
                fcell?.delegate = self
                return fcell!
            }
            else if(indexPath.section == 1)
            {
                let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "PickupInfoCell", for: indexPath) as? PickupInfoCell
                return fcell!
            }
            else if(indexPath.section == 2)
            {
                let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "PickupTimeInfoCell", for: indexPath) as? PickupTimeInfoCell
                return fcell!
            }
            else if(indexPath.section == 3)
            {
                let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "ChoosedServiceCell", for: indexPath) as? ChoosedServiceCell
                fcell?.itemServiceName?.text = "LAUNDRY"
                fcell?.itemTotalCount?.text = "Total \(cartItemss.count ) items"
                fcell?.itemTotalPrice?.text = "Rs. \(cartItemss.count * 25 )"
                return fcell!
            }
            else if(indexPath.section == 4)
            {
                let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "ItemsTotalSummaryCell", for: indexPath) as? ItemsTotalSummaryCell
                fcell?.itemTotalCount?.text = "\(cartItemss.count )"
                fcell?.itemTotalPrice?.text = "\(cartItemss.count * 25 )"
                return fcell!
            }
            else if(indexPath.section == 5)
            {
                let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "PaynowButtonCell", for: indexPath) as? PaynowButtonCell
                fcell?.delegagte = self
                return fcell!
            }
            
            else
            {
                let emptycell = tableviewObj!.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
                return emptycell
            }
                
        }
        func doubleToCurrency(doubleVal: Double) -> String?{
            let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .currency
            currencyFormatter.currencySymbol = "$"
            let priceString = currencyFormatter.string(from: NSNumber(value: doubleVal))!
            return priceString
        }
        
    }
    extension CartVC : NavigationHeaderCellDelegate
    {
        func navigationBackButtonPressed() {
            self.navigationController?.popViewController(animated: true)
        }
    }
    extension CartVC : FranchiseItemCellDelegate
    {
        func someitemsUpdated() {
            cartItemss = CartManager.shared.getAllItem() ?? [Items]()
            if(cartItemss.count > 0)
            {
                itemsSelected = true
            }
            else{
                itemsSelected = false
            }
            self.tableviewObj?.reloadData()
        }
    }
extension CartVC : PaynowButtonCellDelegate
{
    
    func paynowButtonPressed() {
        self.gotoPaymentMethodPage()
    }
}
