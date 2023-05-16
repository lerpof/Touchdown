//
//  UIApplicationExtension.swift
//  Touchdown
//
//  Created by Leonardo Lazzari on 03/05/23.
//

import SwiftUI

extension UIApplication {
    
    func getWindow() -> UIWindow? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        return window
    }
}
