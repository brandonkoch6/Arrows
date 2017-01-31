//
//  KnobView.swift
//  Arrows
//
//  Created by Brandon Koch on 1/25/17.
//  Copyright © 2017 Brandon Koch. All rights reserved.
//

import UIKit

class KnobView: UIView {
    private var _knobRect: CGRect = CGRect.zero
    private var _angle: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        _knobRect: CGRect = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.width);
        
        _knobRect.origin.y = (bounds.height - _knobRect.height) / 2.0
        
        var nibRect: CGRect = CGRect(x: 0.0, y: 0.0, width: _knobRect.width * 0.2, height: _knobRect.height*0.2)
        nibRect.origin.x = knobRect.width - nibRect.width - knobRect.width * 0.05
        nibRect.origin.y = knobRect.origin.y + knobRect.height*0.5 - nibRect.height*0.5
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.lightGray.cgColor)
        context.addEllipse(in: knobRect)
        context.drawPath(using: .fill)
        
        context.setFillColor(UIColor.darkGray.cgColor)
        context.addEllipse(in: nibRect)
        context.drawPath(using: .fill)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        
        let point = CGPoint(
            x: touchPoint.x - _knobRect.midX,
            y: touchPoint.y - _knobRect.midY)
        
        NSLog("X: \(point.x) Y: \(point.y)")
        
        let angle: CGFloat = atan2(point.y, point.x)
        
        NSLog("Angle: \(angle)")
    }
    
    var angle: CGFloat {
        get {
            return _angle
        }
        set {
            _angle = newValue
            setNeedsDisplay()
        }
    }
}
