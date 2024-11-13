//
//  EndTextEditing.swift
//  Took
//
//  Created by dgsw07 on 10/31/24.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
