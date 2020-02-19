//
//  CommonLableCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/18.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class CommonLabelCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!

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
        lblTitle.text = data.title
        lblSubTitle.text = data.subTitle
    }

    func clear() {
        lblTitle.text = nil
        lblSubTitle.text = nil
    }
    
}
