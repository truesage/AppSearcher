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
        Log(output: String(indexPath.row) + "///" + data.trackName!)
        clear()
        if let iconURL = data.artworkUrl512 {
            imgIcon.downloaded(from: iconURL, contentMode: .scaleAspectFit)
        }
        lblName.text = data.trackName
        lblSeller.text = data.sellerName
        if let genres = data.genres, genres.count > 0 {
            lblGenre.text = genres[0]
        }
        lblPrice.text = data.formattedPrice
        viewRating.rating = data.averageUserRating ?? 0.0
    }

    func clear() {
        imgIcon.image = nil
        lblName.text = nil
        lblSeller.text = nil
        lblGenre.text = nil
        lblPrice.text = nil
        viewRating.rating = 0.0
    }
    
}
