//
//  DetailViewController.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/18.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    var appData: Result?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if #available(iOS 11.0, *) {
//            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .never
        }
    }

    func setData(data: Result) {
        appData = data
        if dataList == nil {
            dataList = [CellData]()
        }

        if let screenshotUrls = data.screenshotUrls, screenshotUrls.count > 0 {
            let item = ScreenshotCellData()
            item.type = .SCREENSHOT
            item.valueList = screenshotUrls
            item.screenshotList = [ScreenshotData]()
            for i in 0..<screenshotUrls.count {
                guard let url = URL(string: screenshotUrls[i]) else {
                    continue
                }
                let screenshot = ScreenshotData()
                screenshot.url = screenshotUrls[i]
                screenshot.indexPath = IndexPath(row: i, section: 0)
                DispatchQueue.global().async { [weak self] in
                    let data = try? Data(contentsOf: url)
                    if let data = data, let image = UIImage(data: data) {
                        screenshot.image = image
                        screenshot.size = CGSize(width: image.size.width * 0.6, height: image.size.height * 0.6)
                        item.height = screenshot.size!.height + 8
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    }
                }
                item.screenshotList?.append(screenshot)
            }
            dataList?.append(item)
        }

        if data.trackName != nil || data.sellerName != nil {
            let item = CellData()
            item.type = .COMMON_LABEL
            item.title = data.trackName
            item.subTitle = data.sellerName
            dataList?.append(item)
        }

        if let price = data.price {
            let item = CellData()
            item.type = .PRICE
            if price > 0 {
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                item.title = numberFormatter.string(from: NSNumber(value: price))
            }
//            item.height = 34
            dataList?.append(item)
        }

        if let trackViewUrl = data.trackViewUrl {
            let item = TwoButtonCellData()
            item.type = .TWO_BUTTON
            item.height = 60
            item.leftTitle = "웹에서 보기"
            item.value = trackViewUrl
            item.leftClickListener = {
                if let url = URL(string: trackViewUrl) {
                    UIApplication.shared.open(url, options: [:])
                }
            }
            item.rightTitle = "공유하기"
            item.rightClickListener = { [weak self] in
                if let url = URL(string: trackViewUrl) {
                    let items = [url]
                    let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
                    self?.present(ac, animated: true)
                }
            }
            dataList?.append(item)

        }

        if let bytes = data.fileSizeBytes, let bytesInt = Int64(bytes) {
            let fileSize = ByteCountFormatter.string(fromByteCount: bytesInt, countStyle: .binary)
            let item = CellData()
            item.type = .TITLE_VALUE
            item.title = "크기"
            item.value = fileSize
            dataList?.append(item)
        }

        if let trackContentRating = data.trackContentRating {
            let item = CellData()
            item.type = .TITLE_VALUE
            item.title = "연령"
            item.value = trackContentRating
            dataList?.append(item)
        }

        if let releaseNotes = data.releaseNotes {
            let item = CellData()
            item.type = .EXPANDABLE
            item.title = "새로운 기능"
            item.value = data.version
            item.desc = releaseNotes
            dataList?.append(item)
        }

        if let description = data.description {
            let item = CellData()
            item.type = .DESCRIPTION
            item.desc = description
            dataList?.append(item)
        }

        let blank = CellData()
        blank.type = .BLANK
        blank.height = 16
        dataList?.append(blank)

        if let genres = data.genres {
            let section = CellData()
            section.type = .SECTION
            section.title = "카테고리"
            dataList?.append(section)

            let item = CellData()
            item.type = .CATEGORY
            item.valueList = genres
            dataList?.append(item)

            dataList?.append(blank)
        }

    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = dataList?[indexPath.row] as? CellData, let type = data.type else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
        var cell = getTableViewCell(tableView, data: data)
        if cell != nil {
            return cell!
        }

        cell = tableView.dequeueReusableCell(withIdentifier: CellConstant.getTableViewCellIdentifier(type))

        if type == .CATEGORY {
            // TODO
        }

        if type == .PRICE {
            if let cell = cell as? PriceCell {
                cell.setData(data)
                return cell
            }
        }

        if type == .SCREENSHOT {
            if let cell = cell as? HorizontalCollectionCell {
                cell.setData(data, indexPath: indexPath)
                return cell
            }
        }

        return super.tableView(tableView, cellForRowAt: indexPath)
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let data = dataList?[indexPath.row] as? CellData, data.height > 0 else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
        return data.height
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = dataList?[indexPath.row] as? CellData else {
            return
        }
        if data.type == .EXPANDABLE {
            data.isExpand = !data.isExpand
            tableView.beginUpdates()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
