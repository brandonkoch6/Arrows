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
        let knobRect: CGRect = CGRect(x: 0.0, y: (bounds.height - bounds.width)/2, width: bounds.size.width, height: bounds.size.width)
        
        var nibRect: CGRect = CGRect(x: knobRect.width*0.5, y: knobRect.width*0.5, width: knobRect.width * 0.2, height: knobRect.height*0.2)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.lightGray.cgColor)
        context.addEllipse(in: knobRect)
        context.drawPath(using: .fill)
        
        context.setFillColor(UIColor.darkGray.cgColor)
        context.addEllipse(in: nibRect)
        context.drawPath(using: .fill)
    }
}
