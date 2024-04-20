//
//  Tab.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/19.
//

import SwiftUI

struct TabItem: Identifiable {
    @State var selectedTab:Tab = .home
    
    var id = UUID()
    var text:String
    var icon:String
    var tab:Tab
    var color:Color
}

// =================

// 需要在这里留一个接口,在设置里通过功能开关打开和关闭模块 使用enum
    // 在最上面定义状态,控制是否打开
    // 设置里面用toggle按钮控制状态

// =================
var tabItems = [
    TabItem(text: "learn now ", icon: "house", tab: .home, color: .teal),
    
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore, color: .indigo),
    
    TabItem(text: "Notice ", icon: "bell", tab: .notice, color: .pink),
    
    TabItem(text: "Library", icon: "book",tab: .library, color: .yellow)
]

enum Tab:String{
    case home
    case explore
    case notice
    case library
}

// 在这里保存tabItemWidth
struct TabPreferenceKey:PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
