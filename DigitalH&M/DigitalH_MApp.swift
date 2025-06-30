//
//  DigitalH_MApp.swift
//  DigitalH&M
//
//  Created by Facultad de Contaduría y Administración on 25/06/25.
//

import SwiftUI
import UIKit

@main
struct DigitalH_MApp: App {
    init() {
        for family in UIFont.familyNames.sorted() {
            print("Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print(" → \(name)")
            }
        }
    }

    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

