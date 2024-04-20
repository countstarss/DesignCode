//
//  HexagonView.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/18.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        
        Canvas { context, size in
            
//            context.draw(Image("Blob 1"), in: CGRect(x: 15, y: 15, width: 170, height: 170))
                
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: 200, height: 212))
            
        }
        .frame(width:200,height:212)
        .foregroundStyle(.linearGradient(colors: [.pink,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    HexagonView()
}
