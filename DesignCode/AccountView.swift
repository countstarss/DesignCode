//
//  AccountView.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/18.
//

import SwiftUI

struct AccountView: View {
    @State var isDelete = false
    
    var body: some View {
        NavigationView {

            List {
                VStack(spacing:10){
                    Image(systemName: "person")
                        .font(.system(size: 32))
                        //颜色模式
//                        .symbolRenderingMode(.palette)
                        //颜色
                        .foregroundStyle(.indigo)
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(
                            Image(systemName: "hexagon")
                                .symbolVariant(.fill)
                                .foregroundColor(.indigo)
                                .font(.system(size: 240))
                                .offset(x:-50,y:-110)
                    )
                    
                    Text("Luke King")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "location")
                            .font(.system(size: 18))
                        Text("China")
                    }
                }
                .frame(maxWidth:.infinity)
                Section{
                    //usage of navigationLink
                    // 1
                    NavigationLink(destination: ContentView()){
                        Label("Setting",systemImage: "gear")
                    }
                    
                    // 2
                    NavigationLink{
                        ContentView()
                    } label: {
                        Label("Billing",systemImage: "creditcard")
                    }
                    
                    NavigationLink{
                        ContentView()
                    } label: {
                        Label("Help",systemImage: "questionmark.circle")
                    }
                    
                    
                }
                .listRowSeparator(.hidden)
//              .listRowSeparator(.hidden)
                
                if isDelete == false {
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        HStack {
                            Label("Apple",systemImage: "house")
                            Spacer()
                            Image(systemName: "link")
                                .foregroundColor(.secondary)
                        }
                    }
                    .swipeActions(edge: .trailing,allowsFullSwipe: true){
                        //打开allowsFullSwipe之后,如果拉满,默认就已经点击了这个按钮
                        //拉动和点击作用相同,都使用Button里边的这个action
                        Button(action: { isDelete = true }) {
                            Label("Delete",systemImage: "trash")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading,allowsFullSwipe: true){
                        Button(action: {  }) {
                            Label("Pin",systemImage: "pin")
                        }
                        .tint(.yellow)
                }
                }
                
                Link(destination: URL(string: "https://www.youtobe.com")!) {
                    HStack {
                        Label("Youtobe",systemImage: "tv")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
