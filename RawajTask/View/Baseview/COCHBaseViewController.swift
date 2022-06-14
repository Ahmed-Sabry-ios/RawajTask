//
//  COCHBaseViewController.swift
//  ALCOACH-IOS
//
//  Created by walaa gomaa on 8/24/20.
//  Copyright © 2020 walaa gomaa. All rights reserved.
//

import UIKit

class COCHBaseViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.pickledBluewoodMirageGradient()

        if #available(iOS 13.0, *) {
            if ThemeManager.instance.isDark(){
            overrideUserInterfaceStyle = .dark
                UIApplication.shared.statusBarUIView?.backgroundColor = Mirage

            }else {
                overrideUserInterfaceStyle = .light
                UIApplication.shared.statusBarUIView?.backgroundColor = white

            }
        } else {
            // Fallback on earlier versions
        }

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if ThemeManager.instance.isDark(){
        return .lightContent
        }
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            // Fallback on earlier versions
            return .lightContent
        }
    }
}
