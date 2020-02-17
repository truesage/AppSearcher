//
//  BaseViewController.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/16.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    let tableView = UITableView()

    var dataList: [Any]?
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            return bottom > 0
        } else {
            return false
        }
    }

    override var shouldAutorotate: Bool {
        false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .portrait
    }

    var isVisible: Bool {
        self.viewIfLoaded?.window != nil
    }

    override func loadView() {
        super.loadView()
    }

    private func initView() {

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.canCancelContentTouches = false
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200

        self.tableView.register(UINib(nibName: "AppSimpleInfoCell", bundle: Bundle.main), forCellReuseIdentifier: "AppSimpleInfoCell")
        self.tableView.register(UINib(nibName: "BlankCell", bundle: Bundle.main), forCellReuseIdentifier: "BlankCell")

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.tableView)
//        self.tableView.backgroundColor = RGB(242, 242, 242)
        self.tableView.backgroundColor = UIColor.white
        self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NotificationCenter.default.removeObserver(self)
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

extension BaseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension;
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension BaseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell.init()
    }


}
