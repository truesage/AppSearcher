//
//  CellConstant.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/19.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import Foundation

class CellConstant {
    enum CellType {
        case BLANK
        case COMMON_LABEL
        case DESCRIPTION
        case EXPANDABLE
        case TITLE_VALUE
        case HORIZONTAL_COLLECTION
        case SECTION
        case TWO_BUTTON
        case CATEGORY
        case PRICE
        case SCREENSHOT
        case APP_SIMPLE_INFO
    }

    enum CellIdentifier: String {
        case BlankCell
        case CommonLabelCell
        case DescriptionCell
        case ExpandableCell
        case HorizontalCollectionCell
        case SectionCell
        case TwoButtonCell
        case CategoryCell
        case PriceCell
        case ScreenshotCell
        case AppSimpleInfoCell
    }

    class func getTableViewCellIdentifier(_ type: CellType) -> String {
        var identifier: String?
        switch (type) {
        case .BLANK:
            identifier = CellIdentifier.BlankCell.rawValue
        case .COMMON_LABEL:
            identifier = CellIdentifier.CommonLabelCell.rawValue
        case .DESCRIPTION:
            identifier = CellIdentifier.DescriptionCell.rawValue
        case .EXPANDABLE,
             .TITLE_VALUE:
            identifier = CellIdentifier.ExpandableCell.rawValue
        case .HORIZONTAL_COLLECTION:
            identifier = CellIdentifier.HorizontalCollectionCell.rawValue
        case .SECTION:
            identifier = CellIdentifier.SectionCell.rawValue
        case .TWO_BUTTON:
            identifier = CellIdentifier.TwoButtonCell.rawValue
        case .CATEGORY:
//            identifier = CellIdentifier.CategoryCell.rawValue
            identifier = CellIdentifier.HorizontalCollectionCell.rawValue
        case .SCREENSHOT:
            identifier = CellIdentifier.HorizontalCollectionCell.rawValue
        case .PRICE:
            identifier = CellIdentifier.PriceCell.rawValue
        case .APP_SIMPLE_INFO:
            identifier = CellIdentifier.AppSimpleInfoCell.rawValue
        }
        assert(identifier != nil, "Cell Type에 맞는 Cell Identifier가 연결되어야 함.")
        return identifier!
    }

    class func getCollectionViewCellIdentifier(_ type: CellType) -> String {
        var identifier: String?
        if type == .SCREENSHOT {
            identifier = CellIdentifier.ScreenshotCell.rawValue
        } else if type == .CATEGORY {
            identifier = CellIdentifier.CategoryCell.rawValue
        }
        assert(identifier != nil, "Cell Type에 맞는 Cell Identifier가 연결되어야 함.")
        return identifier!
    }


}

