//
//  PaymentMethodsVC.swift
//  LaunSmart
//
//  Created by apple on 26/03/21.
//


    import UIKit

        class PaymentMethodsVC: UIViewController {
            @IBOutlet weak var tableviewObj : UITableView?
            var itemsSelected = false
            var cartItemss = [Items]()
            var paymentMethods = ["Paytm", "Google pay", "Google pay", "Paypal", "Credit Card"]
            internal required init?(coder aDecoder: NSCoder) {
                super.init(coder: aDecoder)
            }
            private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
                super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            }
            class func instance() -> PaymentMethodsVC {
                let thisStoryboard = UIStoryboard(name: "PaymentSt", bundle: nil)
                let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "PaymentMethodsVC") as! PaymentMethodsVC
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
            let cellIds = ["NavigationHeaderCell","ItemsTotalSummaryPaymentCell","PaymentMethodsCell", "FranchiseHeaderCell"]
            func registerTableCells(){
                for cellId in cellIds{
                    self.tableviewObj?.register(UINib(nibName: cellId, bundle: Bundle.main), forCellReuseIdentifier: cellId)
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
        extension PaymentMethodsVC : UITableViewDelegate
        {
            func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                if(section == 0)
                {
                    return 0.0
                }
                if(section == 1)
                {
                    return 0.0
                }
                else if(section == 2)
                {
                    return 40.0
                }
                
                else
                {
                    return 0.0
                }
               // return 0.0
            }
            
            
        }
        extension PaymentMethodsVC : UITableViewDataSource
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
                    return paymentMethods.count
                }
                
                
                else
                {
                    return 0
                }
            }
            
            func numberOfSections(in tableView: UITableView) -> Int {
                return 3
            }
            func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                
                let headerView = UIView()
                        let headerCell = tableviewObj!.dequeueReusableCell(withIdentifier: "FranchiseHeaderCell") as! FranchiseHeaderCell
                if(section == 0)
                {
                }
                else if(section == 1)
                {
                   
                }
                else if(section == 2)
                {
                    headerCell.setSectionHeaderText(title: "CHOOSE PAYMENT")
                }
                else
                {
                    
                }
               
                
                headerView.addSubview(headerCell)
                        return headerView
            }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
                if(indexPath.section == 0)
                {
                    let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "NavigationHeaderCell", for: indexPath) as? NavigationHeaderCell
                    fcell?.title?.text = "Payment"
                    fcell?.delegate = self
                    return fcell!
                }
                else if(indexPath.section == 1)
                {
                    let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "ItemsTotalSummaryPaymentCell", for: indexPath) as? ItemsTotalSummaryPaymentCell
                    fcell?.amount_discount_label?.text = "5"
                    fcell?.amount_total_label?.text = "\(cartItemss.count * 25)"
                    fcell?.amount_net_label?.text = "\((cartItemss.count * 25) - 5)"
                    return fcell!
                }
                else if(indexPath.section == 2)
                {
                    let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "PaymentMethodsCell", for: indexPath) as? PaymentMethodsCell
                    let payementMethod = paymentMethods[indexPath.row]
                    fcell?.paymentMethodName?.text = payementMethod
                    fcell?.paymentMethodIcon?.image = UIImage(named: payementMethod )
                    
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
        extension PaymentMethodsVC : NavigationHeaderCellDelegate
        {
            func navigationBackButtonPressed() {
                self.navigationController?.popViewController(animated: true)
            }
        }
        extension PaymentMethodsVC : FranchiseItemCellDelegate
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
