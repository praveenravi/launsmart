//
//  ItemsTotalSummary.swift
//  LaunSmart
//
//  Created by apple on 25/03/21.
//

import UIKit

class ItemsTotalSummaryCell: UITableViewCell {
    
    
    @IBOutlet weak var itemTotalCount : UILabel?
    @IBOutlet weak var itemTotalPrice : UILabel?
            

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
