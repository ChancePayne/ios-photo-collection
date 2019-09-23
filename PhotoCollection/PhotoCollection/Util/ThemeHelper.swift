//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Chance Payne on 9/20/19.
//  Copyright © 2019 Chance Payne. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {
    struct Themes {
        static let LIGHT = "light"
        static let DARK = "dark"
    }

    struct Colors {
        static let LIGHT: UIColor = .white
        static let DARK: UIColor = .darkGray
    }
    
    var themePreference: String {
        return UserDefaults.standard.string(forKey: .themePreferenceKey) ?? ThemeHelper.Themes.LIGHT
    }
    
    func setThemePreference(to name: String) {
        UserDefaults.standard.set(name, forKey: .themePreferenceKey)
    }
}

extension String {
    static var themePreferenceKey = "ThemePreferenceKey"
}
