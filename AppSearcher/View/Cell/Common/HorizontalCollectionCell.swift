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

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        layout.itemSize = CGSize(width: 300, height: 700)
        collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: collectionLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: CellConstant.CellIdentifier.ScreenshotCell.rawValue, bundle: Bundle.main), forCellWithReuseIdentifier: CellConstant.CellIdentifier.ScreenshotCell.rawValue)
        collectionView.register(UINib(nibName: CellConstant.CellIdentifier.CategoryCell.rawValue, bundle: Bundle.main), forCellWithReuseIdentifier: CellConstant.CellIdentifier.CategoryCell.rawValue)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        contentView.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

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

    func setData(_ data: CellData, indexPath: IndexPath) {
        self.data = data
        valueList = data.valueList
        self.indexPath = indexPath
        if data.type == .SCREENSHOT, let data = data as? ScreenshotCellData {
            valueList = data.screenshotList
        }
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
                if let size = value.size {
//                    collectionLayout.itemSize = size
                }
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
}


class HorizontalCollectionLayout: UICollectionViewLayout {

}
