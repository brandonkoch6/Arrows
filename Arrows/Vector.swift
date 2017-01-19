//
//  Vector.swift
//  Arrows
//
//  Created by Brandon Koch on 1/18/17.
//  Copyright © 2017 Brandon Koch. All rights reserved.
//

import Foundation

class Vector {
    // Properties
    var x: Float
    var y: Float
    
    // Computed Properties
    var magnitude: Float {
        get { return sqrt(x*x + y*y) }
        set {
            scaleBy(scalar: newValue/magnitude)
        }
    }
    
    // Initializer
    init(xAxisValue px: Float, yAxisValue py: Float) {
        x = px
        y = py
        
    }
    
    func scaleBy(scalar: Float) {
        x *= scalar
        y *= scalar
    }
    
    func addVector(vector: Vector) {
        x += vector.x
        y += vector.y
    }
    
    static func addVectors(v1: Vector, v2: Vector) -> Vector {
        return Vector(xAxisValue: v1.x + v2.x , yAxisValue: v1.y + v2.y)
    }
}


