//
//  DarkTheme.swift
//  Trend Kuwait Task
//
//  Created by ProMap on 04/02/2022.
//

import UIKit

let PigeonPost = UIColor(hexString: "#B1BBE0")
let CuriousBlue = UIColor(hexString: "#2492D1")
let ToryBlue = UIColor(hexString: "#0F4EA3")
let BlueRibbon = UIColor(hexString: "#2254FB")
let PickledBluewood = UIColor(hexString: "#353F62")
let Mirage = UIColor(hexString: "#131725")
let Turquoise = UIColor(hexString: "#30DDE5")
let PictonBlue = UIColor(hexString: "#2CBAEB")
let Lynch = UIColor(hexString: "#6975A0")
let LynchLight = UIColor(hexString: "#9CA5C6")
let PurpleHeart = UIColor(hexString: "#6E2BC9")
let Sunglow = UIColor(hexString: "#FEC32D")
let Supernova = UIColor(hexString: "#FFC500")
let DoveGray = UIColor(hexString: "#707070")
let white = UIColor(hexString: "#FFFFFF")
let black = UIColor(hexString: "#000000")
let Sirocco = UIColor(hexString: "#727E7E")
let Amber = UIColor(hexString: "#FDC300")
let orangeYellow = UIColor(hexString: "#FEAE2D")
let planOrange = UIColor(hexString: "#FEAE2D")
let planBlue = UIColor(hexString: "#2CBAEB")
let planGreen = UIColor(hexString: "#1DC421")

@available(iOS 12.0, *)
struct DarkTheme: Theme {
    var overrideUserInterfaceStyle: UIUserInterfaceStyle = .dark
    
    var tabBarTintColor: UIColor  = Mirage
    
    let tint: UIColor = PictonBlue
    let secondaryTint: UIColor = PigeonPost
    
    let backgroundColor: UIColor = Mirage
    let separatorColor: UIColor = Mirage
    let selectionColor: UIColor = .init(red: 38/255, green: 38/255, blue: 40/255, alpha: 1)
    
    let labelColor: UIColor = BlueRibbon
    let secondaryLabelColor: UIColor = UIColor(hexString: "")
    let subtleLabelColor: UIColor = UIColor(hexString: "")
    
    let barStyle: UIBarStyle = .black
}
