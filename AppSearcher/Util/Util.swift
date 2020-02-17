//
// Created by JinSung Lee on 2020/02/15.
// Copyright (c) 2020 JinSung Lee. All rights reserved.
//

import Foundation
import UIKit

func BASE_LOG(filename: String = #file, line: Int = #line, funcname: String = #function) {
    Log(filename: filename, line: line, funcname: funcname)
}

func Log(filename: String = #file, line: Int = #line, funcname: String = #function, output: Any...) {
    #if DEBUG
    let now = NSDate()
    print("[\(now.description)][\(URL(fileURLWithPath: filename).lastPathComponent)][\(funcname)][Line \(line)] \(output)")
    #endif
}

// MARK: - Color
func RGB(_ r: Int, _ g: Int, _ b: Int) -> UIColor {
    RGBA(r, g, b, 1.0)
}

func RGBA(_ r: Int, _ g: Int, _ b: Int, _ a: CGFloat) -> UIColor {
    UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: a)
}

// MARK: - Common Extensions
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else {
                return
            }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }

    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else {
            return
        }
        downloaded(from: url, contentMode: mode)
    }

    // from : https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
}
