//
//  ArticlesCell.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//

import UIKit
import Localize_Swift

enum AppLang : String{
    case en
    case ar
}


struct LanguageManager {
    static let instance : LanguageManager = {
        let instance = LanguageManager()
        return instance
    }()
    private init (){}
    
    func  isArabic() -> Bool {
        if defaults.getLanguage() == AppLang.ar.rawValue {
            return true
        }
        return false
    }
    
    
    func setAppLanguage (){
        Localize.setCurrentLanguage(defaults.getLanguage())
        
        if (isArabic()) {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            
            UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
            UILabel.appearance().semanticContentAttribute = .forceRightToLeft
            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
            UITableViewCell.appearance().semanticContentAttribute = .forceRightToLeft
            UITableView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
            UICollectionView.appearance().semanticContentAttribute = .forceRightToLeft
            UIStackView.appearance().semanticContentAttribute = .forceRightToLeft
            
            UIScrollView.appearance().semanticContentAttribute = .forceRightToLeft
            
            
        }
        else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
            UILabel.appearance().semanticContentAttribute = .forceLeftToRight
            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
            UITableViewCell.appearance().semanticContentAttribute = .forceLeftToRight
            UITableView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
            UICollectionView.appearance().semanticContentAttribute = .forceLeftToRight
            UIStackView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).semanticContentAttribute = .unspecified
        
    }
    
    func setAppLanguage (lang:AppLang){
        Localize.setCurrentLanguage(lang.rawValue)
        defaults.setLanguage(lang: lang.rawValue)
        defaults.synchronize()
        #if DEBUG
     //   PrintHelper.print(defaults.getLanguage())
        #endif
        setAppLanguage()
    }
    
    func getLangid () ->String {
        return isArabic() ? "2" : "1"
    }
}

