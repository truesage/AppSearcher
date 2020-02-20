//
//  CategoryCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/18.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ data: String) {
        clear()
        lblTitle.text = "#" + data
    }

    func clear() {
        lblTitle.text = nil
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        //Exhibit A - We need to cache our calculation to prevent a crash.
        setNeedsLayout()
        layoutIfNeeded()
        var newFrame = layoutAttributes.frame
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        newFrame.size = size
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }

}
