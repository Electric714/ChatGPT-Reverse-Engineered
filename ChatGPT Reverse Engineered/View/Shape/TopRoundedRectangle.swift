//
//  TopRoundedRectangle.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/24/25.
//

import SwiftUI

struct TopRoundedRectangle: Shape {
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start from bottom-left
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Bottom-left to bottom-right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Bottom-right to top-right with rounded corner
        path.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: -90),
            clockwise: true
        )
        
        // Top-right to top-left with rounded corner
        path.addArc(
            center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 180),
            clockwise: true
        )
        
        // Top-left to bottom-left
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.closeSubpath()
        
        return path
    }
}
