//
//  PriceCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/18.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class PriceCell: UITableViewCell {

    @IBOutlet weak var lblPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(_ data: CellData) {
        clear()
        guard let title = data.title else {
            lblPrice.text = "무료"
            return
        }
        let price = NSMutableAttributedString(string: title, attributes: [.font: UIFont.boldSystemFont(ofSize: 19)])
        price.append(
                NSAttributedString(string: " 원", attributes: [.font: UIFont.systemFont(ofSize: 14)])
        )
        lblPrice.attributedText = price
    }

    func clear() {
        lblPrice.text = nil
        lblPrice.attributedText = nil
    }
}
