//
//  SearchDetailVC.swift
//  LaunSmart
//
//  Created by apple on 18/03/21.
//

import UIKit

class SearchDetailVC: UIViewController {
    @IBOutlet weak var tableviewObj : UITableView?
    var itemsSelected = false
    var itemsArray = [Items]()
    var itemsArray2 = [Items]()
    var cartItemss = [Items]()
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    class func instance() -> SearchDetailVC {
        let thisStoryboard = UIStoryboard(name: "SearchSt", bundle: nil)
        let thisVC = thisStoryboard.instantiateViewController(withIdentifier: "SearchDetailVC") as! SearchDetailVC
        return thisVC
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerTableCells()
        readJsonFromLocalfile()
        cartItemss = CartManager.shared.getAllItem() ?? [Items]()
        tableviewObj?.delegate = self
        tableviewObj?.dataSource = self
        // Do any additional setup after loading the view.
    }
    private func readJsonFromLocalfile() {
        if let path = Bundle.main.path(forResource: "ItemsData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                let allItems = try jsonDecoder.decode(Json4Swift_Base.self, from: data)
                itemsArray = allItems.items1!
                itemsArray2 = allItems.items2!
                self.tableviewObj!.reloadData()
              } catch {
                print("\(error.localizedDescription)")
              }
        }
    }
    // Register TableViewCells
    let cellIds = ["NavigationHeaderCell","FranchiseTCell","FranchiseHeaderCell","ChooseServiceCell","FranchiseItemCell","PlaceOrderButtonCell"]
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
extension SearchDetailVC : UITableViewDelegate
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
       else if(section == 3)
        {
        return 40.0
        }
       else if(section == 4)
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
extension SearchDetailVC : UITableViewDataSource
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
            return itemsArray.count
        }
        else if (section == 4)
        {
            return itemsArray2.count
        }
        else if (section == 5)
        {
            return itemsSelected ? 1 : 0 
          
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
//            headerCell.secionHeaderTitleView?.isHidden = true
//            headerCell.secionHeaderTitleView?.isHidden = true
        }
        if(section == 1)
        {
//            headerCell.secionHeaderTitleView?.isHidden = true
//            headerCell.secionHeaderTitleView?.isHidden = true
        }
        if(section == 2)
        {
            headerCell.setSectionHeaderText(title: "CHOOSE SERVICE")
        }
        if(section == 3)
        {
           // headerCell.setSectionHeaderAndSubHeaderText(headerTitle: "CHOOSE ITEM FOR LAUNDRY", subHeadertitle: "MEN")
            headerCell.setSectionSubHeaderText(title: "MEN")
        }
        if(section == 4)
        {
            headerCell.setSectionSubHeaderText(title: "WOMEN")
        }
        
        headerView.addSubview(headerCell)
                return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if(indexPath.section == 0)
        {
            let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "NavigationHeaderCell", for: indexPath) as? NavigationHeaderCell
            fcell?.title?.text = "Alappy"
            fcell?.delegate = self
            return fcell!
        }
        else if(indexPath.section == 1)
        {
            let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "FranchiseTCell", for: indexPath) as? FranchiseTCell
            return fcell!
        }
        else if(indexPath.section == 2)
        {
            let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "ChooseServiceCell", for: indexPath) as? ChooseServiceCell
            return fcell!
        }
        else if(indexPath.section == 3)
        {
            let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "FranchiseItemCell", for: indexPath) as? FranchiseItemCell
            fcell?.initCell()
            let item = itemsArray[indexPath.row]
            fcell!.itemNameLabel?.text = item.itemTitle
            fcell!.itemPriceLabel?.text = doubleToCurrency(doubleVal: Double(item.itemPrice!))
            fcell!.itemPrice = item.itemPrice ?? 0
            fcell?.itemCount = item.itemCount ?? 0
            fcell?.delegate = self
            fcell?.item = item
            if(CartManager.shared.hasItemInCart(checkitem: item))
            {
                let carItem = CartManager.shared.getItem(itemId: item.itemID!)
                if(carItem != nil)
                {
                    fcell?.itemCount = carItem?.itemCount ?? 0
                    fcell?.initFromCart()
                }
            }
            return fcell!
        }
        else if(indexPath.section == 4)
        {
            let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "FranchiseItemCell", for: indexPath) as? FranchiseItemCell
            fcell?.initCell()
            let item = itemsArray2[indexPath.row]
            fcell!.itemNameLabel?.text = item.itemTitle
            fcell!.itemPriceLabel?.text = doubleToCurrency(doubleVal: Double(item.itemPrice!))
            fcell!.itemPrice = item.itemPrice ?? 0
            fcell?.itemCount = item.itemCount ?? 0
            fcell?.delegate = self
            fcell?.item = item
            if(CartManager.shared.hasItemInCart(checkitem: item))
            {
                let carItem = CartManager.shared.getItem(itemId: item.itemID!)
                if(carItem != nil)
                {
                    fcell?.itemCount = carItem?.itemCount ?? 0
                    fcell?.initFromCart()
                }
            }
            return fcell!
        }
        else if(indexPath.section == 5)
        {
            let fcell = tableviewObj!.dequeueReusableCell(withIdentifier: "PlaceOrderButtonCell", for: indexPath) as? PlaceOrderButtonCell
            fcell?.delegate = self
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
    
    func gotoCartPage()
    {
        let cartPageInstance = CartVC.instance()
        self.navigationController?.pushViewController(cartPageInstance, animated: true)
    }
}
extension SearchDetailVC : NavigationHeaderCellDelegate
{
    func navigationBackButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}
extension SearchDetailVC : FranchiseItemCellDelegate
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
extension SearchDetailVC : PlaceOrderButtonCellDelegate
{
    func placeOrderButtonPressed() {
        cartItemss = CartManager.shared.getAllItem() ?? [Items]()
        if(cartItemss.count > 0)
        {
            self.gotoCartPage()
        }
    }
}
