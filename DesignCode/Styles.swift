//
//  Styles.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/18.
//

import SwiftUI

struct StrokeStyle:ViewModifier {
    var cornerRadius :CGFloat
    //通过环境添加颜色模式handle ,在sytle中根据colorScheme的不同切换不同的style
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content.overlay(
                RoundedRectangle(cornerRadius: cornerRadius,style: .continuous)
                    .stroke(
                        .linearGradient(
                            colors:[
                                .white.opacity(colorScheme == .dark ?  0.6 : 0.3),
                                .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                            ], startPoint: .top, endPoint: .bottom
                        )
                    )
                    //使用blendmode调整混合模式,让添加的overlay和原来的内容叠加更自然
                    .blendMode(.overlay)
            )
    }
    
    
}

extension View {
    func strokeStyle(cornerRadius:CGFloat = 30) -> some View{
        modifier(StrokeStyle(cornerRadius: 30.0))
    }
}
