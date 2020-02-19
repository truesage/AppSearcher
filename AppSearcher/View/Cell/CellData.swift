//
//  CellData.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/19.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import Foundation
import UIKit

class CellData {
    var type: CellConstant.CellType?
    var title: String?
    var subTitle: String?
    var value: String?
    var desc: String?
    var icon: UIImage?
    var height: CGFloat = -1
    var isExpand: Bool = false
    var valueList: [String]?
}

class ScreenshotCellData: CellData {
    var screenshotList: [ScreenshotData]?
}

class ScreenshotData {
    var url: String?
    var indexPath: IndexPath?
    var image: UIImage?
    var size: CGSize?
}
