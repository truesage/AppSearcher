//
//  ExpandableCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/18.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {

    let defDescMarginTop: CGFloat = 8.0
    let defDescMarginBottom: CGFloat = 8.0
    
    @IBOutlet weak var lblLeft: UILabel!
    @IBOutlet weak var lblRight: UILabel!
    @IBOutlet weak var btnExpandIcon: UIButton!
    
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var constraintDescMarginTop: NSLayoutConstraint!
    @IBOutlet weak var constraintDescMarginBottom: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(_ data: CellData) {
        clear()

        lblLeft.text = data.title
        lblRight.text = data.value

        if data.type == .EXPANDABLE {
            lblDesc.text = data.desc
            btnExpandIcon.isHidden = false
            if data.isExpand != btnExpandIcon.isSelected {
                setExpnad(expand: data.isExpand)
            }
        }
    }
    
    private func setExpnad(expand: Bool) {
        btnExpandIcon.isSelected = expand
        if expand {
            constraintDescMarginTop.constant = defDescMarginTop
            constraintDescMarginBottom.constant = defDescMarginBottom
        } else {
            constraintDescMarginTop.constant = 0
            constraintDescMarginBottom.constant = 0
        }
    }

    func clear() {
        lblLeft.text = nil
        lblRight.text = nil
        lblDesc.text = nil
        btnExpandIcon.isSelected = false
        btnExpandIcon.isHidden = true
        setExpnad(expand: false)
    }
    
}
