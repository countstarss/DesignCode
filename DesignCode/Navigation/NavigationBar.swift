//
//  NavigationBar.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/20.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var hasScrolled : Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
//                .opacity(hasScrolled ? 1 : 0)
                .offset(y:hasScrolled ? -4 : 0)
            
            Text(title)
                .animatableFont(size: hasScrolled ? 22 : 32 , weight: .bold, design: .default)
//                .font(hasScrolled ? .title.weight(.bold) : .largeTitle.weight(.bold))
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.leading,20)
                .padding(.top,20)
            
            HStack(spacing:16){
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.bold))
                    .frame(width:36,height: 36)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                
                Image("Avatar Default")
                    .resizable()
                    .frame(width:26,height:26)
                    .cornerRadius(14)
                    .padding(6)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                
            }
            .frame(maxWidth:.infinity,alignment:.trailing)
            .padding(.horizontal,20)
            
            
        }
        .frame(height:hasScrolled ? 34 : 70)
        .frame(maxHeight:.infinity,alignment:.top)
    }
}

#Preview {
    // 在声明是提前写好默认值之后,后边调用不写也不会报错,写上title就会显示响应的内容
    NavigationBar(title: "feature", hasScrolled: .constant(false))
}
