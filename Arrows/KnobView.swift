//
//  KnobView.swift
//  Arrows
//
//  Created by Brandon Koch on 1/25/17.
//  Copyright © 2017 Brandon Koch. All rights reserved.
//

import UIKit

class KnobView: UIControl {
    
    private var knobRect: CGRect = CGRect.zero
    private var _angle: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        knobRect = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.width)
        knobRect.origin.y = (bounds.height - knobRect.height) / 2.0
        
        // Create the nib
        // Establishing a new coordinate system
        // So we need to position the nib based on the origin of the knob
        var nibRect: CGRect = CGRect(x: 0.0, y: 0.0, width: knobRect.width * 0.2, height: knobRect.height * 0.2)
        nibRect.origin.x = knobRect.midX + (knobRect.width * 0.35 * cos(angle)) - nibRect.width / 2.0
        nibRect.origin.y = knobRect.midY + (knobRect.height * 0.35 * sin(angle)) - nibRect.height / 2.0
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.lightGray.cgColor)
        context.addEllipse(in: knobRect)
        context.drawPath(using: .fill)
        
        context.setFillColor(UIColor.darkGray.cgColor)
        context.addEllipse(in: nibRect)
        context.drawPath(using: .fill)
    }
    
    func offsetCoordinates(_ point: CGPoint) -> CGPoint {
        let point: CGPoint = CGPoint(
            x: point.x - knobRect.midX,
            y: point.y - knobRect.midY)
        return point
    }
    
    func polarCoordinates(_ point: CGPoint) -> CGPoint {
        let radius = sqrt(point.x * point.x + point.y * point.y)
        let theta: CGFloat = atan2(point.y, point.x)
        return CGPoint(x: radius, y: theta)
    }
    
    var angle: CGFloat {
        get {
            return _angle
        }
        set {
            _angle = newValue
            // Redraw the view
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        // Need to offset our x and y into a new coordinate system so they're centered
        let point: CGPoint = offsetCoordinates(touchPoint)
        angle = polarCoordinates(point).y
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        // Need to offset our x and y into a new coordinate system so they're centered
        let point: CGPoint = offsetCoordinates(touchPoint)
        angle = polarCoordinates(point).y
        sendActions(for: UIControlEvents.valueChanged)
    }
    
}
