//
//  ArticlesCell.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//
import UIKit

extension UIApplication {
    var statusBarUIView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482458385
            if let statusBar = keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag
                keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        } else {
            return nil
        }
    }
}
