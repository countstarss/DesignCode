//
//  FEaturedItem.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/20.
//

import SwiftUI

struct FeaturedItem: View {
    var course:Course = courses[0]
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
            Spacer()
            Image(course.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(20.0)
                .padding(9)
                .background(.ultraThickMaterial,in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .strokeStyle(cornerRadius: 3)
            
            Text(course.title)
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundStyle(.linearGradient(colors: [.primary,.primary.opacity(0.5)], startPoint: .topLeading, endPoint: .topTrailing))
            Text(course.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
            // 使用字体颜色和Style将使字体能够适应light和dark模式
                .foregroundStyle(.secondary)
            Text(course.text)
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
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30,style: .continuous))
        // RoundedRectangle 的这个属性 style: .continuous ,可以让圆角过渡更加圆滑
        // mask会遮挡范围之外的内容
        //.mask(RoundedRectangle(cornerRadius: 35,style: .continuous))
        
//        .shadow(radius: 20)
//        .shadow(color: Color("Shadow").opacity(0.3), radius: 10,x: 0,y:10)
        .strokeStyle()
        .padding(.horizontal,20)
//        .background(Image("Blob 1").offset(x: 230, y:-110))
        
    }
}

#Preview {
    FeaturedItem()
}
