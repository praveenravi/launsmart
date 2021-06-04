//
//  ProfileMenuCell.swift
//  LaunSmart
//
//  Created by apple on 26/03/21.
//

import UIKit

class ProfileMenuCell: UITableViewCell {
    @IBOutlet weak var menuItemName: UILabel?
        @IBOutlet weak var menuItemIcon: UIImageView?
            
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
