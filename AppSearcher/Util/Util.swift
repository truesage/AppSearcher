//
// Created by JinSung Lee on 2020/02/15.
// Copyright (c) 2020 JinSung Lee. All rights reserved.
//

import Foundation

func BASE_LOG(filename: String = #file, line: Int = #line, funcname: String = #function) {
    print("\(filename)[\(funcname)][Line \(line)]")
}

func Log(filename: String = #file, line: Int = #line, funcname: String = #function, output:Any...) {
    #if DEBUG
    let now = NSDate()
    print("[\(now.description)][\(filename)][\(funcname)][Line \(line)] \(output)")
    #endif
}

