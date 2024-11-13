//
//  KeyboardGuardian.swift
//  Took
//
//  Created by dgsw07 on 9/20/24.
//

import SwiftUI
import Combine

class KeyboardGuardian: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    private var cancellable: AnyCancellable?
    
    init() {
        self.cancellable = NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .compactMap { (notification) -> CGFloat? in
                if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    if frame.origin.y >= UIScreen.main.bounds.height {
                        return 0
                    } else {
                        return frame.height
                    }
                }
                return nil
            }
            .assign(to: \.keyboardHeight, on: self)
    }
}
