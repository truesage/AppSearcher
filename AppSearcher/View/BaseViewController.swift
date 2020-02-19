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
        self.tableView.estimatedRowHeight = 44

        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.BlankCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.BlankCell.rawValue)
        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.CommonLabelCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.CommonLabelCell.rawValue)
        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.DescriptionCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.DescriptionCell.rawValue)
        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.ExpandableCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.ExpandableCell.rawValue)
        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.SectionCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.SectionCell.rawValue)
        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.TwoButtonCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.TwoButtonCell.rawValue)
//        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.CategoryCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.CategoryCell.rawValue)
        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.PriceCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.PriceCell.rawValue)
        self.tableView.register(UINib(nibName: CellConstant.CellIdentifier.AppSimpleInfoCell.rawValue, bundle: Bundle.main), forCellReuseIdentifier: CellConstant.CellIdentifier.AppSimpleInfoCell.rawValue)

        self.tableView.register(HorizontalCollectionCell.self, forCellReuseIdentifier: CellConstant.CellIdentifier.HorizontalCollectionCell.rawValue)

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

    func getTableViewCell(_ tableView: UITableView, data: Any) -> UITableViewCell? {
        guard let data = data as? CellData, let type = data.type else {
            return nil
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: CellConstant.getTableViewCellIdentifier(type))
        if type == .BLANK {
            return cell
        }

        if type == .COMMON_LABEL {
            guard let cell = cell as? CommonLabelCell else {
                return nil
            }
            cell.setData(data)
            return cell
        }

        if type == .DESCRIPTION {
            guard let cell = cell as? DescriptionCell else {
                return nil
            }
            cell.setData(data)
            return cell
        }

        if type == .EXPANDABLE ||
                   type == .TITLE_VALUE {
            guard let cell = cell as? ExpandableCell else {
                return nil
            }
            cell.setData(data)
            return cell
        }

        if type == .SECTION {
            guard let cell = cell as? SectionCell else {
                return nil
            }
            cell.setData(data)
            return cell
        }

        if type == .TWO_BUTTON {
            guard let cell = cell as? TwoButtonCell, let data = data as? TwoButtonCellData else {
                return nil
            }
            cell.setData(data)
            return cell
        }


        return nil
    }

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
