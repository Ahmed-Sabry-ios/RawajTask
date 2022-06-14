//
//  ArticlesCell.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//

import UIKit

enum AppTheme : String{
    case light
    case dark
}

@available(iOS 12.0, *)
struct ThemeManager {
    static let instance : ThemeManager = {
        let instance = ThemeManager()
        return instance
    }()
    private init (){}
    
    
    func setAppTheme(){
        print(AppTheme.light.rawValue)
        if defaults.getTheme() == AppTheme.light.rawValue {
            let theme = LightTheme()
            if #available(iOS 13.0, *) {
                UIApplication.shared.windows.filter {$0.isKeyWindow}.first?
                    .rootViewController?.overrideUserInterfaceStyle = .light
            } else {
                // Fallback on earlier versions
            }
            
            theme.apply(for: UIApplication.shared)
        }else {
            let theme = DarkTheme()
            if #available(iOS 13.0, *) {
                UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.overrideUserInterfaceStyle = .dark
            } else {
                // Fallback on earlier versions
            }
            
            theme.apply(for: UIApplication.shared)
        }
        
        
        
    }
    
    func isDark() -> Bool {
        print(AppTheme.light.rawValue)
        print(AppTheme.dark.rawValue)
       return defaults.getTheme() == AppTheme.dark.rawValue
     //   return true
    }
    
    
    
    func setAppTheme(theme:String){
        
        defaults.setTheme(theme: theme)
        
        setAppTheme()
    }
    
    
}
