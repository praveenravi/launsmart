//
//  NavigationHeaderCell.swift
//  LaunSmart
//
//  Created by apple on 18/03/21.
//

import UIKit
protocol NavigationHeaderCellDelegate {
    func navigationBackButtonPressed()
}

class NavigationHeaderCell: UITableViewCell {
    @IBOutlet weak var backButton: UIButton?
    @IBOutlet weak var backButtonImage : UIImageView?
    @IBOutlet weak var title : UILabel?

    var delegate :NavigationHeaderCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func BackButtonPressed(sender : AnyObject)
    {
        self.delegate?.navigationBackButtonPressed()
    }

}
