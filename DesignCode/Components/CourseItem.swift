//
//  CourseItem.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/24.
//

import SwiftUI

struct CourseItem: View {
//    var namespace: Namespace.ID
    @Namespace var namespace
    @Binding var show :Bool

    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            
            Button{
                withAnimation(.spring(response: 0.6,dampingFraction: 0.8)) {
                    show.toggle()
                }
            }label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial,in: Circle())
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
            .padding(35)
            .ignoresSafeArea()
        }
    }
    var cover: some View{
        VStack {
            Spacer()
            VStack (alignment: .leading,spacing: 12){
                Text("SwiftUI")
                    // 03 添加几何过渡效果,id是为了让两个过渡的元素匹配,in参数则是Namespace
                    // 04 任何在添加match效果之间,所有的属性都应该一样,比如字体,大小,字重,否则,动画会有问题
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                    .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth:.infinity,alignment: .leading)
                Text("20 sections - 3hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.white)
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("Build an app for iOS 15 with custom layouts,animation and ...")
                    .font(.footnote)
                    .foregroundStyle(.white)
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            .padding(40)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .opacity(0.7)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            
        }
        
        .frame(height: 300)
        .background(
            Image("Illustration 9")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            Image("Background 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .padding(20)
    }
}

#Preview {
//    @Namespace var namespace
    CourseItem(show: .constant(false))
}
