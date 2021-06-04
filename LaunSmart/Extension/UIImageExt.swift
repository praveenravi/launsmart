//
//  UIImageExt.swift
//  LaunSmart
//
//  Created by apple on 16/03/21.
//

import UIKit

class RoundImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true

    }
}
