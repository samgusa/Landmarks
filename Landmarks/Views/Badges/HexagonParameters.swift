//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/25/21.
//

import Foundation
import CoreGraphics
//use this structure to define the shape of a hexagon.

struct HexagonParameters {
    //holds three points that represent one side of the hexagon,
    //Each side starts where the previos ends, moves in a straight line to the first point, and then moves over a bezier curve at the corner to the second point. Third point controls the shape of the curve.
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    static let adjustment: CGFloat = 0.085
    
    
    static let segments = [
        Segment(
            line: CGPoint(x: 0.60, y: 0.05),
            curve: CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line: CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve: CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line: CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve: CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line: CGPoint(x: 0.40, y: 0.95),
            curve: CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line: CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve: CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line: CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve: CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
    
}
