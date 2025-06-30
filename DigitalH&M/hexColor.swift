//
//  hexColor.swift
//  DigitalH&M
//
//  Created by Facultad de Contaduría y Administración on 30/06/25.
//

//
//  HexView.swift
//  MiPrimerApp
//
//  Created by Facultad de Contaduría y Administración on 17/06/25.
//

import SwiftUI
extension Color {
    init?(hex: String) {
        let r, g, b: Double
        let hexSanitized = hex
        guard hexSanitized.count == 6,
              let hexNumber = UInt64(hexSanitized, radix: 16) else { return nil }
        r = Double((hexNumber >> 16) & 0xFF) / 255.0
        g = Double((hexNumber >> 8) & 0xFF) / 255.0
        b = Double(hexNumber & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

