//
//  ChooseServiceCell.swift
//  LaunSmart
//
//  Created by apple on 18/03/21.
//

import UIKit

class ChooseServiceCell: UITableViewCell {

    @IBOutlet weak var serviveItem1ButtonView : UIView?
        @IBOutlet weak var serviveItem2ButtonView : UIView?
            @IBOutlet weak var serviveItem3ButtonView : UIView?
                @IBOutlet weak var serviveItem4ButtonView : UIView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func service1Selected(sender : UIButton)
    {
        if(sender.tag == 0)
        {
            serviveItem1ButtonView?.alpha = 1
            sender.tag = 1
        }
        else
        {
            serviveItem1ButtonView?.alpha = 0.5
            sender.tag = 0
        }
    }
    @IBAction func service2Selected(sender : UIButton)
    {
        if(sender.tag == 0)
        {
            serviveItem2ButtonView?.alpha = 1
            sender.tag = 1
        }
        else
        {
            serviveItem2ButtonView?.alpha = 0.5
            sender.tag = 0
        }
    }
    @IBAction func service3Selected(sender : UIButton)
    {
        if(sender.tag == 0)
        {
            serviveItem3ButtonView?.alpha = 1
            sender.tag = 1
        }
        else
        {
            serviveItem3ButtonView?.alpha = 0.5
            sender.tag = 0
        }
    }
    @IBAction func service4Selected(sender : UIButton)
    {
        if(sender.tag == 0)
        {
            serviveItem4ButtonView?.alpha = 1
            sender.tag = 1
        }
        else
        {
            serviveItem4ButtonView?.alpha = 0.5
            sender.tag = 0
        }
    }

}
