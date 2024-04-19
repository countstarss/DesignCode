//
//  TabBar.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/19.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab:Tab = .home
    @State var color:Color = .teal
    @State var tabItemWidth:CGFloat = 0
    
    var body: some View {
        ZStack(alignment:.bottom){
            //modifier可以添加在Group上,不能直接添加在Switch上
            Group{
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    AccountView()
                case .notice:
                    ContentView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)

            HStack{
                Spacer()
                button
                Spacer()
            }
            .padding(.top,28)
            .frame(height:88,alignment:.top)
            .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 34, style: .continuous))
            .background(
                background
                .padding(.horizontal,12)
            )
            .overlay(
                overlay
                .padding(.horizontal,12)
            )
            .strokeStyle(cornerRadius: 34)
        }
        .ignoresSafeArea()
    }
    
    var button :some View {
        ForEach(tabItems) { item in
            Button{
                //geiselectedTab的切换添加一个切换动画
                //dampingFraction 是阻尼,阻尼越大,弹跳越少
                withAnimation(.spring(response: 0.7,dampingFraction:0.7)) {
                    // 这里根据TabBar里边的内容渲染
                    selectedTab = item.tab
                    color = item.color
                }
            } label:{
                VStack{
                    Image(systemName: item.icon)
                        .font(.title)
                        .frame(width:80,height:30)
                }
                .frame(maxWidth:.infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                // 几何阅读器,通过识别组件的大小来决定circle和overlay的宽度
                GeometryReader { proxy in
                    // 这里把TabPreferenceKey检测到的宽度也就是proxy.size.width给了value
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            //  之前已经有了value,通过首选项拿到width
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
    var background:some View {
        HStack {
            
            if selectedTab == .explore{ Spacer() }
            if selectedTab == .notice{ Spacer();Spacer() }
            if selectedTab == .library{ Spacer() }
            
            // 让Circle放置在TabBar每一个选项框架的中间
            Circle().fill(color).frame(width:tabItemWidth)
            
            if selectedTab == .home {Spacer()}
            if selectedTab == .explore{ Spacer();Spacer() }
            if selectedTab == .notice{ Spacer() }
                
        }
    }
    
    var overlay:some View {
        HStack {
            
            if selectedTab == .explore{ Spacer() }
            if selectedTab == .notice{ Spacer();Spacer() }
            if selectedTab == .library{ Spacer() }
            
            Rectangle()
                .fill(color)
                .frame(width:40,height:5)
                .cornerRadius(3)
                // 把上面获取到的宽度赋值给框架的宽度,不需要管组件本身,让它放置在框架的中间
                .frame(width:tabItemWidth)
                .frame(maxHeight:.infinity,alignment:.top)
                .opacity(0.5)
            
            if selectedTab == .home {Spacer()}
            if selectedTab == .explore{ Spacer();Spacer() }
            if selectedTab == .notice{ Spacer() }
                
        }
    }
}

#Preview {
    TabBar()
}
