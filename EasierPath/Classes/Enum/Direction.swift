//
//  Direction.swift
//  EasierPath
//
//  Created by Fomagran on 2022/05/29.
//

import UIKit

public enum Direction {
    case left(_ length:CGFloat)
    case right(_ length:CGFloat)
    case up(_ length:CGFloat)
    case down(_ length:CGFloat)
    case leftDown(_ leftLength:CGFloat,_ downLength:CGFloat)
    case leftUp(_ leftLength:CGFloat,_ upLength:CGFloat)
    case rightDown(_ righLength:CGFloat,_ downLength:CGFloat)
    case rightUp(_ righLength:CGFloat,_ upLength:CGFloat)
}

