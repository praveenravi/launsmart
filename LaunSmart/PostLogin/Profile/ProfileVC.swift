//
//  ProfileVC.swift
//  LaunSmart
//
//  Created by apple on 26/03/21.
//



        import UIKit

            class ProfileVC: UIViewController {
                @IBOutlet weak var tableviewObj : UITableView?
                var itemsSelected = false
                var cartItemss = [Items]()
                var profileMenu = ["My Order", "Book my Order", "My Booking", "PurchasedKgwash", "Purchased Packages","Logout"]
                internal required init?(coder aDecoder: NSCoder) {
                    super.init(coder: aDecoder)
                }
                private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
                    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
                }
                class func instance() -> ProfileVC {
                    let thisStoryboard = UIStoryboard(name: "ProfileSt", bundle: nil)
                    let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
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
                let cellIds = ["NavigationHeaderCell","UserProfileHeaderCell","ProfileMenuCell"]
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
            extension ProfileVC : UITableViewDelegate
            {
               
                
            }
            extension ProfileVC : UITableViewDataSource
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
                        return profileMenu.count
                    }
                    
                    
                    else
                    {
                        return 0
                    }
                }
                
                func numberOfSections(in tableView: UITableView) -> Int {
                    return 3
                }
               
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                   
                    if(indexPath.section == 0)
                    {
                        let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "NavigationHeaderCell", for: indexPath) as? NavigationHeaderCell
                        fcell?.title?.text = "Profile"
                        fcell?.delegate = self
                        return fcell!
                    }
                    else if(indexPath.section == 1)
                    {
                        let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "UserProfileHeaderCell", for: indexPath) as? UserProfileHeaderCell
                       
                        return fcell!
                    }
                    else if(indexPath.section == 2)
                    {
                        let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "ProfileMenuCell", for: indexPath) as? ProfileMenuCell
                        fcell?.menuItemName?.text = profileMenu[indexPath.row]
                        
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
            extension ProfileVC : NavigationHeaderCellDelegate
            {
                func navigationBackButtonPressed() {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
