//
//  VectorView.swift
//  Arrows
//
//  Created by Brandon Koch on 1/23/17.
//  Copyright © 2017 Brandon Koch. All rights reserved.
//

import UIKit

class VectorView: UIView {
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.move(to: CGPoint(x: 10.0, y: 10.0))
        context.addLine(to: CGPoint(x: 100.0, y: 200.0))
        context.drawPath(using: CGPathDrawingMode.stroke)
    }
}
