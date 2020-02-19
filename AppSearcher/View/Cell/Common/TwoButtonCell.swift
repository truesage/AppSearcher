//
//  TwoButtonCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/20.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class TwoButtonCell: UITableViewCell {
    var data: TwoButtonCellData?

    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(_ data: TwoButtonCellData) {
        self.data = data
        btnLeft.setTitle(data.leftTitle, for: .normal)
        btnRight.setTitle(data.rightTitle, for: .normal)
    }

    func clear() {
        btnLeft.setTitle(nil, for: .normal)
        btnRight.setTitle(nil, for: .normal)
    }
    
    @IBAction func onClickLeft(_ sender: Any) {
        data?.leftClickListener()
    }
    
    @IBAction func onClickRight(_ sender: Any) {
        data?.rightClickListener()
    }
    
}
