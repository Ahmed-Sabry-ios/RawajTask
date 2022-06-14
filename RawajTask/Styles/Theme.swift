//
//  Theme.swift
//  Trend Kuwait Task
//
//  Created by ProMap on 04/02/2022.
//

import UIKit


public protocol With {}

public extension With where Self: Any {
    
    /// Makes it available to set properties with closures just after initializing.
    ///
    ///     let label = UILabel().with {
    ///       $0.textAlignment = .center
    ///       $0.textColor = UIColor.black
    ///       $0.text = "Hello, World!"
    ///     }
    @discardableResult
    func with(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: With {}


protocol Theme {
    var tint: UIColor { get }
    var secondaryTint: UIColor { get }
    
    var backgroundColor: UIColor { get }
    var separatorColor: UIColor { get }
    var selectionColor: UIColor { get }
    
    var labelColor: UIColor { get }
    var secondaryLabelColor: UIColor { get }
    var subtleLabelColor: UIColor { get }
    
    var barStyle: UIBarStyle { get }
    var tabBarTintColor:UIColor{get}
    @available(iOS 12.0, *)
    var overrideUserInterfaceStyle: UIUserInterfaceStyle{get}
    
    func apply(for application: UIApplication)
    func extend()
}

extension Theme {
    
    func apply(for application: UIApplication) {
        application.keyWindow?.tintColor = tint
        
        if #available(iOS 13.0, *) {
            application.keyWindow?.overrideUserInterfaceStyle = overrideUserInterfaceStyle
        } else {
            // Fallback on earlier versions
        }
        
        UITabBar.appearance().with {
            $0.tintColor = tint
            $0.barTintColor = tabBarTintColor
            $0.isTranslucent = false
        }
        
        UINavigationBar.appearance().with {
            $0.barStyle = barStyle
            $0.tintColor = tint
            $0.titleTextAttributes = [
                .foregroundColor: labelColor
            ]
            
            if #available(iOS 11.0, *) {
                $0.largeTitleTextAttributes = [
                    .foregroundColor: labelColor
                ]
            }
        }
        
        
        
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .textColor = secondaryLabelColor
        
        UILabel.appearance().textColor = labelColor
        
        UIButton.appearance().with {
            $0.setTitleColor(tint, for: .normal)
            
        }
 
        UISegmentedControl.appearance().tintColor = tint
        
        
        
        // Style differently when inside a special container
        
        
        
        extend()
        
        // Ensure existing views render with new theme
        // https://developer.apple.com/documentation/uikit/uiappearance
        application.windows.reload()
    }
    
    func extend() {
        // Optionally extend theme
    }
}
