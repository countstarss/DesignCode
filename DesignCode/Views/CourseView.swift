//
//  CourseView.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/24.
//

import SwiftUI

struct CourseView: View {
    //    var namespace:Namespace.ID
    @Namespace var namespace
    @Binding var show : Bool
    
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .background(Color("Background"))
        .ignoresSafeArea()
            
            button
        }

    }
    var button :some View {
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
    var cover :some View{
        VStack(alignment: .leading,spacing: 12){
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight:.infinity)
        .padding(20)
        .background(
            Image("Illustration 9")
                .resizable()
                .aspectRatio(contentMode: .fit)
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
        //把overlay移动到mask下面,是因为mask会剪切一切出了它的范围外的东西
        //这个是下面弹出的小窗口
        .overlay(
            VStack(alignment: .leading,spacing: 12){
                //                            Spacer()
                Text("SwiftUI")
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
                Divider()
                HStack{
                    Image("Avatar Default")
                        .resizable()
                        .frame(width:26,height:26)
                        .cornerRadius(14)
                        .padding(6)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .strokeStyle(cornerRadius: 14)
                    Text("Taught by Meng to ")
                        .font(.footnote)
                }
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    //                                    .blur(radius: 30)
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y:200)
                .padding(20)
        )
        .frame(height: 500)
    }
}


#Preview {
    CourseView(show: .constant(true))
}
