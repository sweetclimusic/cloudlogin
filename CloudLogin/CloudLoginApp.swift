//
//  CloudLoginApp.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 04/06/2021.
//

import SwiftUI

@main
struct CloudLoginApp: App {
    
    init() {
        #if DEBUG
        var injectionBundlePath = "/Applications/InjectionIII.app/Contents/Resources"
        #if targetEnvironment(macCatalyst)
        injectionBundlePath = "\(injectionBundlePath)/macOSInjection.bundle"
        #elseif os(iOS)
        injectionBundlePath = "\(injectionBundlePath)/iOSInjection.bundle"
        #endif
        Bundle(path: injectionBundlePath)?.load()
        #endif
    }

    var body: some Scene {
        WindowGroup {
            SignupScreenView()
        }
    }
}
