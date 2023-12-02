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
    var startAngle: Angle = .zero
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        let radius = rect.size.width/2
        let endAngle = endAngle - .degrees(90)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let startAngle = startAngle - .degrees(90)
        let start = CGPoint(x: center.x + radius*cos(CGFloat(startAngle.radians)), y: center.y + radius*sin(CGFloat(startAngle.radians)))
        var p = Path();
        p.move(to:center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        p.addLine(to:center)
        return p
    }
    
    
}
