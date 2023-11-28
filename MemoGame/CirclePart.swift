//
//  CirclePart.swift
//  MemoGame
//
//  Created by student on 28/11/2023.
//

import Foundation
import SwiftUI
import CoreGraphics

struct CirclePart: Shape {
    
    var endDegree: Angle
    
    func path(in rect: CGRect) -> Path {
        let radius = rect.size.width/2
        
        var p = Path();
        p.addArc(center: CGPoint(x: radius, y: radius/2), radius: radius, startAngle: .degrees(-90), endAngle: endDegree, clockwise: false)
        p.addLine(to:CGPoint(x:radius,y:radius/2))
        p.move(to:CGPoint(x:radius,y:-radius/2))
        p.addLine(to:CGPoint(x:radius,y:radius/2))
        return p.strokedPath(.init(lineWidth: 3))
    }
    
    
}
