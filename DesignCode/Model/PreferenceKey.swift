//
//  PreferenceKey.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/20.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}
