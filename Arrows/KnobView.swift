//
//  KnobView.swift
//  Arrows
//
//  Created by Brandon Koch on 1/25/17.
//  Copyright © 2017 Brandon Koch. All rights reserved.
//

import UIKit

class KnobView: UIView {
    
    override func draw(_ rect: CGRect) {
        var knobRect: CGRect = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.width)
        knobRect.origin.y = (bounds.height - knobRect.height) / 2.0
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.addEllipse(in: knobRect)
        context.drawPath(using: .fill)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {

    }
}
