//
//  UIButtonExt.swift
//  LaunSmart
//
//  Created by apple on 16/03/21.
//

import UIKit
class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height/2
       // self.layer.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.6117647059, blue: 0.7529411765, alpha: 1)
    }
}
extension UIButton{
    func setState(_ state: Bool){
        if state{
            self.isEnabled = true
            self.alpha = 1.0
        }else{
            self.isEnabled = false
            self.alpha = 0.5
        }
    }
    func setActiveState(_ state: Bool){
        if state{
            //self.isEnabled = true
            self.alpha = 1.0
        }else{
           // self.isEnabled = false
            self.alpha = 0.5
        }
    }
    
}

