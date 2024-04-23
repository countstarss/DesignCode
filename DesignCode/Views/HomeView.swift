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
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                featured

                Color.clear.frame(height: 1000)
            }
            .coordinateSpace(name:"scroll")
            //因为我们监控滑动的高度使用perferenceKey,所以使用onPerferenceChange控制
            .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
                withAnimation (.easeInOut){
                    if value < 0{
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
                    .opacity(hasScrolled ? 0 : 1)
        )
        }
        
        
    }
    var scrollDetection:some View{
        GeometryReader {proxy in
            //高度的值可以在这里输出出来,但是不能直接用于赋值,需通过首选项键(PreferenceKey)取出
            Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
    }
    
    var featured:some View{
        TabView{
            ForEach(courses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItem(course: course)
                        .padding(.vertical,40)
                        .rotation3DEffect(
//                            可以通过修改axis来获得想要的效果,并且通过修改角度来调整动画幅度
                            .degrees(minX / -10),
                            axis: (x:0,y:1,z:0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10,x: 0,y:10)
                        .blur(radius: abs(minX / 50))
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:230)
                                .offset(x:32,y:-80)
                                //营造视差效果,overlay的移动比卡片更快一些
                                .offset(x:minX / 2)
                        )
//                    Text("\(proxy.frame(in: .global).minX)")
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x: 230, y:-110))
    }
}

#Preview {
    HomeView()
}
