//
//  FEaturedItem.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/20.
//

import SwiftUI

struct FeaturedItem: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(20.0)
                .padding(9)
                .background(.ultraThickMaterial,in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .strokeStyle(cornerRadius: 3)
            
            Text("SwiftUI for iOS 15")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundStyle(.linearGradient(colors: [.primary,.primary.opacity(0.5)], startPoint: .topLeading, endPoint: .topTrailing))
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
            // 使用字体颜色和Style将使字体能够适应light和dark模式
                .foregroundStyle(.secondary)
            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth:.infinity, alignment: .leading)
                .foregroundStyle(.secondary)
            
        }
        .padding(.all, 20.0)
        .padding(.vertical,20)
        .frame(height: 350.0)
        // 把材质和mask结合起来
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 25, style: .continuous))
        // RoundedRectangle 的这个属性 style: .continuous ,可以让圆角过渡更加圆滑
        // mask会遮挡范围之外的内容
        //.mask(RoundedRectangle(cornerRadius: 35,style: .continuous))
        .shadow(radius: 20)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10,x: 0,y:10)
        .strokeStyle()
        .padding(.horizontal,20)
        .background(Image("Blob 1").offset(x: 230, y:-110))
        .overlay(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:230)
                .offset(x:32,y:-80)
        )
    }
}

#Preview {
    FeaturedItem()
}