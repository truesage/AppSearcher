//
//  MainViewController.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/14.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, RequestDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BASE_LOG()

        if !RequestManager.shared.requestSearch(keyword: "핸드메이드", delegate: self) {
            Log(output: "Request Fail")
        }
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
        Log(output: receive.results ?? "results is empty")
        dataList = receive.results
    }

    func onNetworkFail(request: URLRequest, error: Error) {
        Log(output: error.localizedDescription)
    }
}
