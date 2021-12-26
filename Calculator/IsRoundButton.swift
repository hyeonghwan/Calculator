//
//  IsRoundButton.swift
//  IsRoundButton
//
//  Created by 박형환 on 2021/11/07.
//

import UIKit

@IBDesignable class IsRoundButton: UIButton {
  @IBInspectable var isRound: Bool = false {
        didSet{
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
