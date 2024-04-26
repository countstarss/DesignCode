//
//  MatchedView.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/24.
//

import SwiftUI

//屏幕之间共享的文字
struct MatchedView: View {
    //01
    @Namespace var namespace
    @State var show = false
    
    
    var body: some View {
        //02 ZStack onTapGesture
        ZStack {
            if !show{
                CourseItem(namespace: _namespace, show: $show)
                    .onTapGesture {
                        withAnimation{
                            show.toggle()
                            print("toggle toggle !!!")
                        }
                    }
            }else{
                CourseView(namespace: _namespace, show: $show)
            }
        }
        .onTapGesture {
            withAnimation{
                show.toggle()
            }
        }
    }
}

#Preview {
    MatchedView()
}
