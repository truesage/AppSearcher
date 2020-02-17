//
//  BaseNaviController.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/17.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class BaseNaviController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        self.topViewController?.preferredStatusBarStyle ?? super.preferredStatusBarStyle
    }
    override var prefersStatusBarHidden: Bool {
        self.topViewController?.prefersStatusBarHidden ?? super.prefersStatusBarHidden
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        self.topViewController?.preferredStatusBarUpdateAnimation ?? super.preferredStatusBarUpdateAnimation
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
