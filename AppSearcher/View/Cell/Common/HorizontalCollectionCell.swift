//
//  HorizontalCollectionCell.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/18.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class HorizontalCollectionCell: UITableViewCell {
    var data: CellData?
    var valueList: [Any]?
    var indexPath: IndexPath?

    var collectionView: UICollectionView!
    var collectionLayout: UICollectionViewFlowLayout!
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        collectionLayout.estimatedItemSize = CGSize(width: 1, height: 1)


        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: collectionLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: CellConstant.CellIdentifier.ScreenshotCell.rawValue, bundle: Bundle.main), forCellWithReuseIdentifier: CellConstant.CellIdentifier.ScreenshotCell.rawValue)
        collectionView.register(UINib(nibName: CellConstant.CellIdentifier.CategoryCell.rawValue, bundle: Bundle.main), forCellWithReuseIdentifier: CellConstant.CellIdentifier.CategoryCell.rawValue)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        contentView.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        leadingConstraint = collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        leadingConstraint.isActive = true

        trailingConstraint = collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        trailingConstraint.isActive = true

        topConstraint = collectionView.topAnchor.constraint(equalTo: contentView.topAnchor)
        topConstraint.isActive = true

        bottomConstraint = collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.isActive = true

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        collectionView.collectionViewLayout.invalidateLayout()

    }

    func setData(_ data: CellData, indexPath: IndexPath) {
        self.data = data
        valueList = data.valueList
        self.indexPath = indexPath
        if data.type == .SCREENSHOT, let data = data as? ScreenshotCellData {
            valueList = data.screenshotList
            leadingConstraint.constant = 18
            trailingConstraint.constant = -18
            topConstraint.constant = 8
            bottomConstraint.constant = -8
        }
        if data.type == .CATEGORY {
            leadingConstraint.constant = 18
            trailingConstraint.constant = -18
            topConstraint.constant = 8
            bottomConstraint.constant = -18
        }
        collectionView.reloadData()
    }

}

extension HorizontalCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let dataList = valueList else {
            return 0
        }
        return dataList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let value = valueList?[indexPath.row], let type = data?.type else {
            return UICollectionViewCell(frame: CGRect())
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellConstant.getCollectionViewCellIdentifier(type), for: indexPath)
        if type == .SCREENSHOT {
            if let cell = cell as? ScreenshotCell,
               let value = value as? ScreenshotData {
                cell.setData(value)
                return cell
            }
        }

        if type == .CATEGORY {
            if let cell = cell as? CategoryCell,
               let value = value as? String {
                cell.setData(value)
                return cell
            }
        }

        return cell
    }

}

extension HorizontalCollectionCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    /*public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    }*/
    /*override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        BASE_LOG()
        collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: contentView.frame.height)
        collectionView.layoutIfNeeded()
        return collectionView.collectionViewLayout.collectionViewContentSize
    }*/
}


class HorizontalCollectionLayout: UICollectionViewLayout {

}
