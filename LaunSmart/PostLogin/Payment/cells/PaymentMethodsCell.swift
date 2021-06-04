//
//  PaymentMethodsCell.swift
//  LaunSmart
//
//  Created by apple on 26/03/21.
//

import UIKit

class PaymentMethodsCell: UITableViewCell {
    @IBOutlet weak var paymentMethodName : UILabel?
    @IBOutlet weak var paymentMethodIcon : UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
