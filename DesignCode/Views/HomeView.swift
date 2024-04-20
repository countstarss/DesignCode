//
//  HomeView.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/19.
//

import SwiftUI

struct HomeView: View {
    //设置一个状态,控制视图
    @State var hasScrolled = false
    
    var body: some View {
        ScrollView {
            GeometryReader {proxy in
                //高度的值可以在这里输出出来,但是不能直接用于赋值,需通过首选项键(PreferenceKey)取出
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            FeaturedItem()

            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name:"scroll")
        //因为我们监控滑动的高度使用perferenceKey,所以使用onPerferenceChange控制
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation (.easeInOut){
                if value < -10{
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 60)
        })
        
        .overlay(
            NavigationBar(title: "Feature", hasScrolled: $hasScrolled)
                
        )
        
        
    }
}

#Preview {
    HomeView()
}
