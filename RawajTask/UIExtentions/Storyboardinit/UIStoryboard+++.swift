//
//  UIStoryboard+++.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//

import UIKit

enum StoryboardName: String {
    case main = "Main"

}

extension UIStoryboard {
    class func load(_ storyboard: StoryboardName) -> UIViewController? {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateInitialViewController()
    }
    
    class func load(_ storyboard: StoryboardName, identifier: String) -> UIViewController? {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier) 
    }
}
