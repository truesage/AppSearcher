//
//  MainViewController.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/14.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, RequestDelegate {

    var keyword: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BASE_LOG()

        self.tableView.contentInset = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 0.0, right: 0.0)

        keyword = "핸드메이드"
        if !RequestManager.shared.requestSearch(keyword: keyword, delegate: self) {
            Log(output: "Request Fail")
        }

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
//            navigationItem.largeTitleDisplayMode = .never
        }
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
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

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = dataList, list.count > 0 {
            return list.count + 1 // 마지막 마진을 블랭크 셀로 처리.
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let list = dataList, list.count <= indexPath.row {
            let BlankCellIdentifier: String = "BlankCell"
            if let cell: BlankCell = tableView.dequeueReusableCell(withIdentifier: BlankCellIdentifier) as? BlankCell {
                cell.backgroundColor = RGB(242, 242, 242)
                return cell
            }
        }
        let CellIdentifier: String = "AppSimpleInfoCell"
        guard let data: Result = dataList?[indexPath.row] as? Result, let cell: AppSimpleInfoCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as? AppSimpleInfoCell else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }

        cell.setData(data: data, indexPath: indexPath)
        return cell
    }
}


