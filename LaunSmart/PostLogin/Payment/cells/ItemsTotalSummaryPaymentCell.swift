//
//  ItemsTotalSummaryPaymentCell.swift
//  LaunSmart
//
//  Created by apple on 26/03/21.
//

import UIKit

class ItemsTotalSummaryPaymentCell: UITableViewCell {
    
    @IBOutlet weak var amount_total_label : UILabel?
        @IBOutlet weak var amount_discount_label : UILabel?
            @IBOutlet weak var amount_net_label : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
