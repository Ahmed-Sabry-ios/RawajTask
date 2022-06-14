//
//  LightTheme.swift
//  Trend Kuwait Task
//
//  Created by ProMap on 04/02/2022.
//
import UIKit
@available(iOS 12.0, *)
struct LightTheme: Theme {
    var overrideUserInterfaceStyle: UIUserInterfaceStyle = .light
    
    var tabBarTintColor: UIColor  = UIColor(hexString: "")
    
    let tint: UIColor = UIColor(hexString: "")
    let secondaryTint: UIColor = UIColor(hexString: "")
    
    let backgroundColor: UIColor = UIColor(hexString: "")
    let separatorColor: UIColor = UIColor(hexString: "")
    let selectionColor: UIColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
    
    let labelColor: UIColor = UIColor(hexString: "")
    let secondaryLabelColor: UIColor = UIColor(hexString: "")
    let subtleLabelColor: UIColor = UIColor(hexString: "")
    
    let barStyle: UIBarStyle = .default
}
