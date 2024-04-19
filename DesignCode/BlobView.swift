//
//  BlobView.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/18.
//

import SwiftUI

struct BlobView: View {
    @State var appear = false
    
    var body: some View {
        //在Canvas中使用
        TimelineView (.animation){ timeline in
            //目标是将这个时间now应用到Canvas动画中
            let now = timeline.date.timeIntervalSinceReferenceDate
            //设置now为每3s循环一次
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 120)
            //得到一个来回反弹的值,而不是每次循环重置
            let x = cos(angle.radians)
            
//            Text("Value:\(x)")
            
            Canvas { context ,size in
                context.fill(path(in: 
                                    CGRect(x:0,y:0,width: size.width,height:size.height),x:x),
                             with:.linearGradient(
                                Gradient(colors: [.pink,.blue]),
                                startPoint: CGPoint(x: 0, y: 0),
                                endPoint: CGPoint(x: 400, y: 400)
                             )
                        )
            }
            .frame(width:400,height:414)
            .rotationEffect(.degrees(appear ? 365 : 0))
        }
        .onAppear(){
            withAnimation(.spring(duration:20,bounce:0.3).repeatForever()){
                appear = true
            }
            
        }
        

    }
    
    //动画的原理就是将上面变化的x传入path中,
    func path(in rect: CGRect,x:Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        //right
        path.move(to: CGPoint(x: 0.9923*width, y: 0.42593*height))
        //bottom
        path.addCurve(to: CGPoint(x: 0.6355*width, y: height), control1: CGPoint(x: 0.92554*width, y: 0.77749*height), control2: CGPoint(x: 0.91864*width, y: height))
        //left
        path.addCurve(to: CGPoint(x: 0.08995*width, y: 0.60171*height), control1: CGPoint(x: 0.35237*width * x, y: height), control2: CGPoint(x: 0.2695*width, y: 0.77304*height))
        //top
        path.addCurve(to: CGPoint(x: 0.34086*width, y: 0.06324*height), control1: CGPoint(x: -0.0896*width, y: 0.43038*height), control2: CGPoint(x: 0.00248*width, y: 0.23012*height))
        //right
        path.addCurve(to: CGPoint(x: 0.9923*width, y: 0.42593*height), control1: CGPoint(x: 0.67924*width, y: -0.10364*height), control2: CGPoint(x: 1.05906*width, y: 0.07436*height))
        path.closeSubpath()
        return path
    }
}

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9923*width, y: 0.42593*height))
        path.addCurve(to: CGPoint(x: 0.6355*width, y: height), control1: CGPoint(x: 0.92554*width, y: 0.77749*height), control2: CGPoint(x: 0.91864*width, y: height))
        path.addCurve(to: CGPoint(x: 0.08995*width, y: 0.60171*height), control1: CGPoint(x: 0.35237*width, y: height), control2: CGPoint(x: 0.2695*width, y: 0.77304*height))
        path.addCurve(to: CGPoint(x: 0.34086*width, y: 0.06324*height), control1: CGPoint(x: -0.0896*width, y: 0.43038*height), control2: CGPoint(x: 0.00248*width, y: 0.23012*height))
        path.addCurve(to: CGPoint(x: 0.9923*width, y: 0.42593*height), control1: CGPoint(x: 0.67924*width, y: -0.10364*height), control2: CGPoint(x: 1.05906*width, y: 0.07436*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    BlobView()
}
