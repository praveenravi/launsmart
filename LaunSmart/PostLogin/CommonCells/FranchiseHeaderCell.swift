//
//  FranchiseHeaderCell.swift
//  LaunSmart
//
//  Created by apple on 18/03/21.
//

import UIKit

class FranchiseHeaderCell: UITableViewCell {
    @IBOutlet weak var stackView : UIStackView?
    @IBOutlet weak var secionHeaderTitleView : UIView?
    @IBOutlet weak var secionsubHeaderTitleView : UIView?
    @IBOutlet weak var secionHeaderTitle : UILabel?
    @IBOutlet weak var secionsubHeaderTitle : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setSectionHeaderText(title : String)
    {
        secionHeaderTitleView?.isHidden = false
        secionHeaderTitle?.text  = title
        secionsubHeaderTitleView?.isHidden = true
    }
    func setSectionSubHeaderText(title : String)
    {
        secionHeaderTitleView?.isHidden = true
        secionsubHeaderTitleView?.isHidden = false
        secionsubHeaderTitle?.text = title
    }
    func setSectionHeaderAndSubHeaderText(headerTitle : String,subHeadertitle : String)
    {
        secionHeaderTitleView?.isHidden = false
        secionHeaderTitle?.text  = headerTitle
        secionsubHeaderTitleView?.isHidden = false
        secionsubHeaderTitle?.text = subHeadertitle
    }

}
