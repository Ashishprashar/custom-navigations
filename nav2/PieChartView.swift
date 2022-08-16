//
//  PieChartView.swift
//  custom_bottom_navigation2
//
//  Created by Ashish Kumar on 13/08/22.
//

import SwiftUI


struct PieSliceView: View {
    var pieSliceData: PieSliceData
    var isRotate = false
    @State var radius=0
    
    var midRadians: Double {
        return Double.pi / 2.0 - (pieSliceData.startAngle + pieSliceData.endAngle).radians / 2.0
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let height = width
                    
                    let center = CGPoint(x: width/2 , y: height/2)
                    
                    path.move(to: center)
                    
                    path.addArc(
                        center: center,
                        radius: CGFloat(pieSliceData.radius*3+radius),
                        startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle,
                        endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle,
                        clockwise: false)
                    
                }
                .fill(pieSliceData.color)
                
                Image(systemName: pieSliceData.image)
                    .resizable()
                    .frame(width:20,height:20)
                    .rotationEffect(isRotate ? Angle(degrees: 45) : Angle(degrees: 0))

                    .foregroundColor(Color.white)
                    .position(x:0,y:0)
                    .offset(
                        x: CGFloat(pieSliceData.radius*3) * CGFloat(1.0 + 0.75 * cos(self.midRadians)),
                                               y: CGFloat(pieSliceData.radius*3) * CGFloat(1.0 - 0.75 * sin(self.midRadians))
                    )
      
                
            }
        }
        
        .frame(width: CGFloat(pieSliceData.radius*6), height:CGFloat(pieSliceData.radius*6))
        .aspectRatio(1, contentMode: .fit)
    }
}

struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
    var image: String
    var radius:Int

}

struct PieSliceView_Previews: PreviewProvider {
    static var previews: some View {
        PieSliceView(pieSliceData: PieSliceData(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 360.0), color: Color.red, image: "plus",radius: 60))
    }
}
