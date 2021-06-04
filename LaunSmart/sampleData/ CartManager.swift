//
//   CartManager.swift
//  LaunSmart
//
//  Created by apple on 24/03/21.
//


import UIKit

class CartManager {
    
    static let shared = CartManager()
    private var itemArray: [Items]?
    
    func addItemToCart(newitem: Items) {
        if itemArray == nil {
            itemArray = [Items]()
        }else {
            if itemArray!.contains(where: { $0.itemID == newitem.itemID }) {

                 return
            }
        }
        itemArray?.append(newitem)
    }
    func updateItemFromCart(newitem: Items) {
        var filtered = itemArray!.filter { $0.itemID == newitem.itemID }
         
        if filtered.count > 0 {
            filtered[0].itemCount = newitem.itemCount
            itemArray?.removeAll(where: { $0.itemID == newitem.itemID })
            // Do something with firstTester...
            itemArray?.append(filtered[0])
        }
    }
    func removeItemFromCart(newitem: Items) {
        
            itemArray?.removeAll(where: { $0.itemID == newitem.itemID })
            
    }
     func hasItemInCart(checkitem: Items) -> Bool
     {
        if itemArray == nil {
           return false
        }else {
            if itemArray!.contains(where: { $0.itemID == checkitem.itemID }) {
                 return true
            }
        }
        return false
     }
    
    func getItem(itemId : String) -> Items? {
       for item in itemArray!
       {
        if(item.itemID == itemId)
        {
            return item
        }
       }
        return nil
    }
    func getAllItem() -> [Items]? {
        return itemArray
    }
}
