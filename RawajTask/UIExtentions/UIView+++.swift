//
//  ArticlesCell.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//

import UIKit

extension UIView {
   
       func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    
    func mirageRoundedBottom()  {
        let targetRadius: CGFloat = (self.layer.cornerRadius == 0.0) ? 25.0 : 0.0
        self.self.layer.cornerRadius = targetRadius
        
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
            //   layerMinXMinYCorner, .layerMaxXMinYCorner
        } else {
            // Fallback on earlier versions
        }
        if ThemeManager.instance.isDark(){
        self.backgroundColor = Mirage
        }else{
            self.backgroundColor = white
        }
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.clipsToBounds = true
    }
    
    func mirageRoundedTop()  {
        let targetRadius: CGFloat = (self.layer.cornerRadius == 0.0) ? 25.0 : 0.0
        self.self.layer.cornerRadius = targetRadius
        
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [
                //.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
                .layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        if ThemeManager.instance.isDark(){
        self.backgroundColor = Mirage
        }else{
            self.backgroundColor = white
        }
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func mirageCard()  {
           let targetRadius: CGFloat = (self.layer.cornerRadius == 0.0) ? 5.0 : 0.0
           self.self.layer.cornerRadius = targetRadius
           
        if ThemeManager.instance.isDark(){
        self.backgroundColor = Mirage
        }else{
            self.backgroundColor = white
        }
         //  self.layer.shadowColor = UIColor.black.cgColor
         //  self.layer.shadowOpacity = 0.5
         //  self.layer.shadowOffset = .zero
        //   self.layer.shadowRadius = 10
         //  self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
           self.layer.shouldRasterize = true
           self.layer.rasterizationScale = UIScreen.main.scale
       }
    func mirageCardrounded()  {
           let targetRadius: CGFloat = (self.layer.cornerRadius == 0.0) ? 5.0 : 0.0
           self.self.layer.cornerRadius = targetRadius
           
        if ThemeManager.instance.isDark(){
        self.backgroundColor = Mirage
        }else{
            self.backgroundColor = white
        }
         //  self.layer.shadowColor = UIColor.black.cgColor
         //  self.layer.shadowOpacity = 0.5
         //  self.layer.shadowOffset = .zero
        //   self.layer.shadowRadius = 10
         //  self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
           self.layer.shouldRasterize = true
           self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.cornerRadius = 12
       }
    func pickledBluewoodMirageGradient (){
        let gradient: CAGradientLayer = CAGradientLayer()
        if ThemeManager.instance.isDark(){
        gradient.colors = [PickledBluewood.cgColor, Mirage.cgColor]
        }else{
            gradient.colors = [PickledBluewood.cgColor, white.cgColor]
        }
        gradient.locations = [0.0 , 1.0]
        gradient.frame = CGRect(x: 0, y: 0, width: (bounds.width + 20), height: bounds.height)
        self.layer.insertSublayer(gradient, at:0)
        
    }
    
    func pickledBluewoodwhiteGradient (){
        let gradient: CAGradientLayer = CAGradientLayer()
        if ThemeManager.instance.isDark(){
        gradient.colors = [PickledBluewood.cgColor, Mirage.cgColor]
        }else{
            gradient.colors = [BlueRibbon.cgColor, PictonBlue.cgColor]
        }
        gradient.locations = [0.0 , 1.0]
        gradient.frame = CGRect(x: 0, y: 0, width: (bounds.width + 20), height: bounds.height)
        self.layer.insertSublayer(gradient, at:0)
        
    }
    
    func BlueRibbonTurquoiseGradiant (){
        self.applyRightToLeftGradient(colours: [BlueRibbon, Turquoise], locations: [0.0 , 1.0])
    }
    
    func OrangeRibbonTurquoiseGradiant (){
        self.applyRightToLeftGradient(colours: [orangeYellow, orangeYellow], locations: [0.0 , 1.0])
    }
    func OrangeRibbonTurquoiseGradiant10 (){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.applyRightToLeftGradient(colours: [orangeYellow, orangeYellow], locations: [0.0 , 1.0])
    }
    func BlueRibbonTurquoiseGradiantRounded10 (){
         
           self.layer.cornerRadius = 10
           self.clipsToBounds = true
        self.applyRightToLeftGradient(colours: [Turquoise,BlueRibbon], locations: [0.0 , 1.0])
       }
    
    
    func BlueRibbonTurquoiseGradiantRoundedBottom (){
        self.applyRightToLeftGradient(colours: [Turquoise,BlueRibbon], locations: [0.0 , 1.0])
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
            //   layerMinXMinYCorner, .layerMaxXMinYCorner
        } else {
            // Fallback on earlier versions
        }
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func ToryBluePickledBluewoodGradiantRoundedBottom (){
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [ToryBlue.withAlphaComponent(0.5).cgColor, PickledBluewood.withAlphaComponent(0.5).cgColor]
        gradient.locations = [0.0 , 1.0]
       
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
            //   layerMinXMinYCorner, .layerMaxXMinYCorner
        } else {
            // Fallback on earlier versions
        }
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        gradient.frame = CGRect(x: 0, y: 0, width: (bounds.width + 20), height: bounds.height)
        self.layer.insertSublayer(gradient, at:0)
    }
    
    func ToryBluealpga13PickledBluewoodGradiantRoundedTop (){
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [  Sirocco.cgColor, PickledBluewood.cgColor]
        gradient.locations = [0.0 , 1.0]
       
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [
                .layerMinXMinYCorner, .layerMaxXMinYCorner
              //  .layerMaxXMaxYCorner,
                //  .layerMinXMaxYCorner
            ]
            
            //   layerMinXMinYCorner, .layerMaxXMinYCorner
        } else {
            // Fallback on earlier versions
        }
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        gradient.frame = CGRect(x: 0, y: 0, width: (bounds.width + 20), height: bounds.height)
        self.layer.insertSublayer(gradient, at:0)
             
    }
    
    @discardableResult
    func applyRightToLeftGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: (bounds.width + 20), height: bounds.height)
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    @discardableResult
    func applyTopToBottomGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: (bounds.width + 20), height: bounds.height)
       // gradient.locations = locations
      //  gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
      //  gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        //self.layer.insertSublayer(gradient, at: 0)
        
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations?.map {  $0 }
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)

        return gradient
    }
    
    func circlePictonBlue (){
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        self.backgroundColor = PictonBlue
    }
    
    func roundedMirage (){
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.backgroundColor = Mirage
    }
    func borderroundedMirage (){
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
        self.backgroundColor = Mirage
    }
    
    func roundedPurpleHeart (){
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.backgroundColor = PurpleHeart
        
    }
    
    func changeDefaultButtonBackground () {
            //Button.layer.sublayers?.remove(at: 0)
            if let layer = self.layer.sublayers? .first {
                print ("Button.layer.sublayers:", self.layer.sublayers)
                layer.removeFromSuperlayer ()
            }
        }
    
    func removeView(view:UIView) {
        DispatchQueue.main.async {
            view.removeFromSuperview()
        }
    }
}

extension UIView {
    static func loadFromNib<T: UIView>() -> T {
        let name = String(describing: self)
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)![0] as? T ?? T()
    }
    
    func commonInit(viewName:String, owner: UIView) {
        Bundle.main.loadNibNamed(viewName, owner: owner, options: nil)
        
    }
}

extension UIView {
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}
