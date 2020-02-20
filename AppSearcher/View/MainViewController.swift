//
//  MainViewController.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/14.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, RequestDelegate {

    var keyword: String = "핸드메이드"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BASE_LOG()

        self.tableView.contentInset = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 0.0, right: 0.0)

        if !RequestManager.shared.requestSearch(keyword: keyword, delegate: self) {
            Log(output: "Request Fail")
        }

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.navigationItem.title = keyword
    }

    // MARK: - RequestDelegate
    func onNetworkSuccess(request: URLRequest, response: HTTPURLResponse, data: Data?) {
        guard let data = data else {
            return
        }

        let jsonDecoder = JSONDecoder()
        guard let receive = try? jsonDecoder.decode(Response.self, from: data) else {
            return
        }
//        Log(output: receive.results ?? "results is empty")
        dataList = receive.results
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }

    func onNetworkFail(request: URLRequest, error: Error) {
        Log(output: error.localizedDescription)
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let list = dataList, list.count <= indexPath.row {
            return 8.0
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if let list = dataList, list.count <= indexPath.row {
            return
        }
        guard let data: Result = dataList?[indexPath.row] as? Result else {
            return
        }

        let detailView = DetailViewController.init()
        detailView.setData(data: data)
        self.navigationController?.pushViewController(detailView, animated: true)
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = dataList, list.count > 0 {
            return list.count + 1 // 마지막 마진을 블랭크 셀로 처리.
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let list = dataList, list.count <= indexPath.row {
            if let cell: BlankCell = tableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.BlankCell.rawValue) as? BlankCell {
                cell.clear()
                cell.setBGColor(RGB(242, 242, 242))
                return cell
            }
        }
        guard let data: Result = dataList?[indexPath.row] as? Result, let cell: AppSimpleInfoCell = tableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.AppSimpleInfoCell.rawValue) as? AppSimpleInfoCell else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }

        cell.setData(data: data, indexPath: indexPath)
        return cell
    }
}


