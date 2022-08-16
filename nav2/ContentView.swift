//
//  ContentView.swift
//  custom_bottom_navigation2
//
//  Created by Ashish Kumar on 13/08/22.
//

import SwiftUI
import UIKit
let screen = UIScreen.main.bounds
struct ContentView: View {
    @State var isClicked=false
    @State var slicesValues=[0,1,2,3]
    @State var iconName=["homekit","doc","pencil.circle","pencil"]
    @State var colors=[Color.pink,Color.gray,Color.gray,Color.gray]
    @State var radius=[60,60,60,60]
    @State var mainRadius = 0
    var body: some View {
        ZStack {
            if(isClicked){
                ForEach(0..<iconName.count-1){ i in

                    PieSliceView(pieSliceData: PieSliceData(startAngle: Angle(degrees: 270+(90.0/Double(iconName.count-1))*Double(i)), endAngle: Angle(degrees: 270+(90.0/Double(iconName.count-1))*Double(i+1)), color: colors[i], image: iconName[ slicesValues[i]],radius: radius[slicesValues[i]])).animation(.spring(), value: slicesValues[i])
//                        .transition(.rippleTransition())
                        .onTapGesture {
                            UIView.animate(withDuration: 1){
                                
                                
                                slicesValues = slicesValues.suffix(iconName.count-i) + slicesValues.prefix(i)
                               
                                print(slicesValues)
                            }
                        }
                    
                }
            }
            
            PieSliceView( pieSliceData: PieSliceData(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 360), color: Color.red, image: "plus",radius: 25+mainRadius),isRotate: isClicked).animation(.easeIn(duration: 0.25), value: mainRadius)
                .onTapGesture {
                    
                    if(!isClicked){
                        mainRadius=10
                        
                        
                    }else{
                        mainRadius=0
                    }
                    UIView.animate(withDuration: 0.5) {
                        isClicked = !isClicked
                    }
                    
                }
            
            //            .background(Color.red)
            
            //            .ignoresSafeArea()
                
        }
        .frame(width: 300,height: 300)
        .position(x:screen.maxX,y:screen.maxY-50)
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
