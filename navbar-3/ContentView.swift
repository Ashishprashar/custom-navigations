//
//  ContentView.swift
//  navbar-3
//
//  Created by Ashish Kumar on 15/08/22.
//

import SwiftUI
let screen = UIScreen.main.bounds

struct ContentView: View {
    @State var isClicked:Bool = false
    @State var iconName=["homekit","doc","pencil.circle","pencil"]
    @State var selected = 0
    var body: some View {
        ZStack {
            if(isClicked){
                ForEach(0..<iconName.count){ i in
                    
                    PieSliceView(pieSliceData: PieSliceData(startAngle: Angle(degrees: (180.0/(Double(iconName.count)))*Double(i)), endAngle: Angle(degrees: (180.0/(Double(iconName.count)))*Double(i+1)), color: (i==selected) ? Color.orange : Color.gray , image: iconName[i],radius: 60)).animation(.spring(), value: selected)
                        .onTapGesture {
                            UIView.animate( withDuration: 1){
                                selected=i
                            }
                        }
                    
                }.rotationEffect(Angle(degrees: -90))
            }
            if(isClicked)
            {
                PieSliceView( pieSliceData: PieSliceData(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 450), color: Color.red, image: "plus",radius: 25),isRotate: true)
                    .onTapGesture {
                        UIView.animate(withDuration: 0.5) {
                            isClicked = !isClicked
                        }
                        
                }
            }
            
            if(!isClicked) {
                PieSliceView( pieSliceData: PieSliceData(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 450), color: Color.red, image: "plus",radius: 25),isRotate: false)
                    .onTapGesture {
                        UIView.animate(withDuration: 0.5) {
                            isClicked = !isClicked
                        }
                        
                        
                }
    //                .animation(.spring())
    //                .rotationEffect(Angle(degrees: 180))
                    
            }
            
        }
        .frame(width: 300,height: 300)
        
        .position(x:screen.maxX/2.0,y:screen.maxY-30)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
