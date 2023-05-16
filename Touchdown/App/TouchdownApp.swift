//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Leonardo Lazzari on 03/05/23.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
