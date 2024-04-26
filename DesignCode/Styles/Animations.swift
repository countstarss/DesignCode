//
//  Animations.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/26.
//

import SwiftUI

extension Animation{
    static let openCard = Animation.spring(response: 0.5,dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6,dampingFraction: 0.9)
}
