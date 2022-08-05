//
//  DarkModeTools.swift
//  深色模式工具类
//
//  Created by jv-lee on 2022/8/4.
//

import Foundation
import UIKit

class DarkModeTools {
    private let modeKey = "dark_mode_key"
    private let systemKey = "system"
    private let darkKey = "dark"
    private let lightKey = "light"
    private var userDefault = UserDefaults.standard


    static let instance = DarkModeTools()

    private init() {}

    func isSystemTheme() -> Bool {
        let mode = userDefault.string(forKey: modeKey)
        switch mode {
        case lightKey:
            return false
        case darkKey:
            return false
        default:
            return true
        }
    }

    func isDarkTheme() -> Bool {
        let mode = userDefault.string(forKey: modeKey)
        switch mode {
        case lightKey:
            return false
        case darkKey:
            return true
        default:
            if #available(iOS 13, *) {
                let iosMode = UITraitCollection.current.userInterfaceStyle
                return iosMode == .dark
            } else {
                return false
            }
        }
    }

    func updateSystemTheme(enable:Bool) {
        if(enable) {
            userDefault.set(systemKey, forKey: modeKey)
        } else {
            if #available(iOS 13, *) {
                let iosMode = UITraitCollection.current.userInterfaceStyle
                updateDarkTheme(enable: iosMode == .dark)
            } else {
                updateDarkTheme(enable: false)
            }
        }
    }

    func updateDarkTheme(enable:Bool) {
        if(enable) {
            userDefault.set(darkKey, forKey: modeKey)
        } else {
            userDefault.set(lightKey, forKey: modeKey)
        }
    }

}
