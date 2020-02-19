//
//  BlankCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/18.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class BlankCell: UITableViewCell {

    @IBOutlet weak var viewSeparator: UIView!
    
    @IBOutlet weak var constraintSepaLeading: NSLayoutConstraint!
    @IBOutlet weak var constraintSepaTrailing: NSLayoutConstraint!
    @IBOutlet weak var constraintSepaTop: NSLayoutConstraint!
    @IBOutlet weak var constraintSepaBottom: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSeparator(leading: CGFloat = 0.0, trailing: CGFloat = 0.0, top: CGFloat = 0.0, bottom: CGFloat = 0.0, color: UIColor = RGB(221, 221, 221)) {
        constraintSepaLeading.constant = leading
        constraintSepaTrailing.constant = trailing
        constraintSepaTop.constant = top
        constraintSepaBottom.constant = bottom
        viewSeparator.backgroundColor = color
        viewSeparator.isHidden = false
    }
    
    func clear() {
        viewSeparator.isHidden = true
    }
    
}
