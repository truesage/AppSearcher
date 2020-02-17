//
//  BorderView.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/17.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

@IBDesignable
class BorderView: UIView {

    @IBInspectable
    var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
//            self.clipsToBounds = true
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

