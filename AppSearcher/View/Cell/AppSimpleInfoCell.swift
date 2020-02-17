//
//  AppSimpleInfoCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/17.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit
import Cosmos

class AppSimpleInfoCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSeller: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewRating: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: Result, indexPath: IndexPath) {
        
    }
    
}
