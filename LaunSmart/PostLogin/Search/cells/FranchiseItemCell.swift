//
//  FranchiseItemCell.swift
//  LaunSmart
//
//  Created by apple on 18/03/21.
//

import UIKit
protocol FranchiseItemCellDelegate {
    func someitemsUpdated()
}

class FranchiseItemCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel : UILabel?
    @IBOutlet weak var itemPriceLabel : UILabel?
    @IBOutlet weak var itemCountLabel : UILabel?
    @IBOutlet weak var itemCountView : UIView?
    @IBOutlet weak var itemCalPriceLabel : UILabel?
    @IBOutlet weak var itemSlectionCheckBox : UIImageView?
   
    @IBOutlet weak var itemDecreaseCountIcon : UIImageView?
    @IBOutlet weak var itemIncreaseCountIcon : UIImageView?
    @IBOutlet weak var itemDecreaseCountIconButton : UIButton?
    @IBOutlet weak var itemIncreaseCountIconButton : UIButton?
    var itemCount = 0
    var itemPrice = 25
    var itemSelected = false
    var delegate :FranchiseItemCellDelegate?
    var item: Items!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initCell()
    {
         itemCount = 0
         itemPrice = 25
        itemSlectionCheckBox?.image = UIImage(named: "unticked")
        itemSelected = false
        itemCount = 0
        itemCountLabel?.text = "\(itemCount)"
        let calculatedPrice = itemCount * itemPrice
        itemCalPriceLabel?.text = "Rs \(calculatedPrice)"
        itemCountView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    func initFromCart()
    {
        
        itemSlectionCheckBox?.image = UIImage(named: "ticked")
        itemSelected = true
        itemCountLabel?.text = "\(itemCount)"
        let calculatedPrice = itemCount * itemPrice
        itemCalPriceLabel?.text = "Rs \(calculatedPrice)"
        itemCountView?.backgroundColor = #colorLiteral(red: 0.05625555664, green: 0.3662150204, blue: 0.7512488961, alpha: 1)
    }
    
    @IBAction func decreaseCount(sender : UIButton)
    {
        if(!itemSelected)
        {
            return
        }
        if(itemCount == 0)
        {
            itemDecreaseCountIcon?.alpha = 0.1
            itemDecreaseCountIconButton?.setState(false)
            itemCountView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        else
        {
            itemCount = itemCount - 1
            itemCountLabel?.text = "\(itemCount)"
        }
        let calculatedPrice = itemCount * itemPrice
        itemCalPriceLabel?.text = "Rs \(calculatedPrice)"
        item.itemCount = itemCount
        CartManager.shared.updateItemFromCart(newitem: item)
        self.delegate?.someitemsUpdated()
        if(itemCount == 0)
        {
            self.itemUnchecked()
        }
       
    }
    @IBAction func increaseCount(sender : UIButton)
    {
        if(!itemSelected)
        {
            return
        }
        if(itemCount == 0)
        {
        itemDecreaseCountIcon?.alpha = 1
        itemDecreaseCountIconButton?.setState(true)
            itemCountView?.backgroundColor = #colorLiteral(red: 0.05625555664, green: 0.3662150204, blue: 0.7512488961, alpha: 1)
        }
        itemCount = itemCount + 1
        itemCountLabel?.text = "\(itemCount)"
        let calculatedPrice = itemCount * itemPrice
        itemCalPriceLabel?.text = "Rs \(calculatedPrice)"
        item.itemCount = itemCount
        CartManager.shared.updateItemFromCart(newitem: item)
        self.delegate?.someitemsUpdated()
        
    }
    func itemInitialchecked()
    {
       
        
        itemSlectionCheckBox?.image = UIImage(named: "ticked")
        itemSelected = true
        itemCount = 1
        itemCountLabel?.text = "\(itemCount)"
        let calculatedPrice = itemCount * itemPrice
        itemCalPriceLabel?.text = "Rs \(calculatedPrice)"
        itemCountView?.backgroundColor = #colorLiteral(red: 0.05625555664, green: 0.3662150204, blue: 0.7512488961, alpha: 1)
        itemDecreaseCountIcon?.alpha = 1
        itemDecreaseCountIconButton?.setState(true)
        item.itemCount = itemCount
        CartManager.shared.addItemToCart(newitem: item)
        self.delegate?.someitemsUpdated()
    }
    func itemUnchecked()
    {
        itemSlectionCheckBox?.image = UIImage(named: "unticked")
        itemSelected = false
        itemCount = 0
        itemCountLabel?.text = "\(itemCount)"
        let calculatedPrice = itemCount * itemPrice
        itemCalPriceLabel?.text = "Rs \(calculatedPrice)"
        itemCountView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        itemDecreaseCountIcon?.alpha = 0.1
        itemDecreaseCountIconButton?.setState(false)
        item.itemCount = itemCount
        CartManager.shared.removeItemFromCart(newitem: item)
        self.delegate?.someitemsUpdated()
        
    }
    @IBAction func selectItem(sender : UIButton)
    {
        if(itemSelected)// not selected yet
        {
            self.itemUnchecked()
        }
        else{
            self.itemInitialchecked()
        }
        
    }
}
