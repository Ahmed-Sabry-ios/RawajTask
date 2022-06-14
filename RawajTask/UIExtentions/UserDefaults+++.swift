//
//  ArticlesCell.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//
import Foundation
enum UserDefaultsKeys : String {
    case firstTime
    case language
    case theme
    case userLogin
    case gist
    case lengthUnit
    case weightUnit
    case userName
    case UserEmail
    
}
let defaults = UserDefaults.standard
extension UserDefaults{
    
    func setValue (key: String, value: Any){
        set(value, forKey: key)
    }
    
    func getBooleanValue(key: String) -> Bool {
        return bool(forKey: key)
    }
    
    func getStringValue(key: String) -> String {
        return string(forKey: key) ?? ""
    }
    
    func getIntValue(key: String) -> Int {
        return integer(forKey: key)
    }
    
    /*------------------- old methods --------------------*/
    func setUserName (userName:String){
        set(userName, forKey: UserDefaultsKeys.userName.rawValue)
    }
    
    func getUserName ()-> String{
        return string(forKey: UserDefaultsKeys.userName.rawValue) ?? ""
    }
    
    
    
    func setUseremail (userName:String){
        set(userName, forKey: UserDefaultsKeys.UserEmail.rawValue)
    }
    
    func getUseremail ()-> String{
        return string(forKey: UserDefaultsKeys.UserEmail.rawValue) ?? ""
    }
    
    
    
    func setLanguage (lang:String){
        set(lang, forKey: UserDefaultsKeys.language.rawValue)
    }
    
    func getLanguage ()-> String{
        return string(forKey: UserDefaultsKeys.language.rawValue) ??  Locale.current.languageCode ?? AppLang.en.rawValue
    }
    
    func setLengthUnit (lang:String){
        set(lang, forKey: UserDefaultsKeys.lengthUnit.rawValue)
    }
    
    func getLengthUnit ()-> String{
        return string(forKey: UserDefaultsKeys.lengthUnit.rawValue) ?? "CM"
    }
    
    func setWeightUnit (lang:String){
        set(lang, forKey: UserDefaultsKeys.weightUnit.rawValue)
    }
    
    func getWeightUnit ()-> String{
        return string(forKey: UserDefaultsKeys.weightUnit.rawValue) ?? "KG"
    }
    
    
    
    func setIsFirstTime (lang:Bool){
        set(lang, forKey: UserDefaultsKeys.firstTime.rawValue)
    }
    
    func getIsFirstTime ()-> Bool?{
        return bool(forKey: UserDefaultsKeys.firstTime.rawValue)
    }
    
    
    func setTheme (theme:String){
        set(theme, forKey: UserDefaultsKeys.theme.rawValue)
    }
    
    func getTheme ()-> String{
        return string(forKey: UserDefaultsKeys.theme.rawValue) ?? ""
    }
    
 
  
}
