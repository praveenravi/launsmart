//
//  PlaceOrderButtonCell.swift
//  LaunSmart
//
//  Created by apple on 24/03/21.
//

import UIKit
protocol PlaceOrderButtonCellDelegate
{
    func placeOrderButtonPressed()
}
class PlaceOrderButtonCell: UITableViewCell {
    var delegate :PlaceOrderButtonCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func placeOrderButtonPressed(sender : UIButton)
    {
        self.delegate?.placeOrderButtonPressed()
    }

}
