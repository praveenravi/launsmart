//
//  UIViewExt.swift
//  LaunSmart
//
//  Created by apple on 17/03/21.
//

import UIKit
class RoundedView:UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height/2
       // self.layer.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.6117647059, blue: 0.7529411765, alpha: 1)
    }
}
