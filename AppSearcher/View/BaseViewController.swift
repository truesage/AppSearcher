//
//  BaseViewController.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/16.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var tableView: UITableView = UITableView.init()
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


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


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


}

extension BaseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell.init()
    }


}
