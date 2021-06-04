//
//  PlaceOrderButtonCell.swift
//  LaunSmart
//
//  Created by apple on 24/03/21.
//

import UIKit
protocol PaynowButtonCellDelegate
{
    func paynowButtonPressed()
}
class PaynowButtonCell: UITableViewCell {

    var delegagte : PaynowButtonCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func paynowButtonPressed(sender : UIButton)
    {
        self.delegagte?.paynowButtonPressed()
    }

}
