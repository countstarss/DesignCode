//
//  ContentView.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/18.
//

import SwiftUI

struct ContentView: View {
    //写到AppStorage里,长期存储
    @AppStorage("selectedTab") var selectedTab:Tab = .home
    
    var body: some View {
        
        ZStack(alignment:.bottom){
            //modifier可以添加在Group上,不能直接添加在Switch上
//            Group{
                switch selectedTab {
                case .home:
                    HomeView(show: .constant(true))
                case .explore:
                    MatchedView()
                case .notice:
                    HomeView(show: .constant(true))
                case .library:
                    AccountView()
                }
//            }
//            .frame(maxWidth:.infinity,maxHeight:.infinity)
            
            TabBar()
        }
        //safeAreaInset的作用是让安全区域往回收缩一定的量,具体多少看clear的frame:height是多少
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
        
    }
}

#Preview {
    ContentView()
}
