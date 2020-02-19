//
//  ScreenshotCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/18.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {

    var data: ScreenshotData?
    
    @IBOutlet weak var imgScreenshot: UIImageView!
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ data: ScreenshotData) {
        self.data = data
        if let image = data.image {
            if let size = data.size {
                constraintHeight.constant = size.height
                constraintWidth.constant = size.width
            }
            imgScreenshot.image = image
        }
    }

    //forces the system to do one layout pass
    var isHeightCalculated: Bool = false

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        //Exhibit A - We need to cache our calculation to prevent a crash.
        if !isHeightCalculated {
            setNeedsLayout()
            layoutIfNeeded()
            var newFrame = layoutAttributes.frame
            if let size = data?.size {
                newFrame.size = size
                isHeightCalculated = true
            } else {
                let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
                newFrame.size.width = CGFloat(ceilf(Float(size.width)))
            }
            layoutAttributes.frame = newFrame
        }
        return layoutAttributes
    }

}
