//
//  UIFont+++.swift
//  ALCOACH-IOS
//
//  Created by ProMap on 13/06/2022.
//

import UIKit

/**
  Helvetica Neue :  ["HelveticaNeue-UltraLightItalic", "HelveticaNeue-Medium", "HelveticaNeue-MediumItalic", "HelveticaNeue-UltraLight", "HelveticaNeue-Italic",
  "HelveticaNeue-Light", "HelveticaNeue-ThinItalic", "HelveticaNeue-LightItalic", "HelveticaNeue-Bold",
  "HelveticaNeue-Thin", "HelveticaNeue-CondensedBlack",
  "HelveticaNeue",
 "HelveticaNeue-CondensedBold", "HelveticaNeue-BoldItalic"]
 
 */
struct AppFontName {
    static var UltraLightItalic = "HelveticaNeue-UltraLightItalic"
    static var Medium = "HelveticaNeue-Medium"
    static var MediumItalic = "HelveticaNeue-MediumItalic"
    
    static var UltraLight = "HelveticaNeue-UltraLight"
    static var Italic = "HelveticaNeue-Italic"
    static var Light = "HelveticaNeue-Light"
    static var ThinItalic = "HelveticaNeue-ThinItalic"
    static var LightItalic = "HelveticaNeue-LightItalic"
    static var Bold = "HelveticaNeue-Bold"
    static var Thin = "HelveticaNeue-Thin"
    static var CondensedBlack = "HelveticaNeue-CondensedBlack"
    static var Regular = "HelveticaNeue"
    static var CondensedBold = "HelveticaNeue-CondensedBold"
    static var BoldItalic = "HelveticaNeue-BoldItalic"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.Regular, size: size)!
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.Bold, size: size)!
    }
    
    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.Italic, size: size)!
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.Regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = AppFontName.Bold
        case "CTFontObliqueUsage":
            fontName = AppFontName.Italic
        default:
            fontName = AppFontName.Regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}




