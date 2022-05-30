//
//  EasierPath.swift
//  EasierPath
//
//  Created by Fomagran on 2022/05/29.
//

import UIKit

public class EasierPath:EasierPathProtocol {
        
    public var lastEndPoint:CGPoint
    public var path:UIBezierPath
    internal var layer:CAShapeLayer = CAShapeLayer()
    
    private init(_ path:UIBezierPath,_ last:CGPoint) {
        self.lastEndPoint = last
        self.path = path
    }
    
    public init(_ x:CGFloat,_ y:CGFloat) {
        self.path = UIBezierPath()
        lastEndPoint = CGPoint(x: x, y: y)
        self.path.move(to: CGPoint(x: x, y: y))
    }
    
    public func left(_ length:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x - length, lastEndPoint.y)
    }
    
    public func right(_ length:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x + length, lastEndPoint.y)
    }
    
    public func up(_ length:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x, lastEndPoint.y - length)
    }
    
    public func down(_ length:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x, lastEndPoint.y + length)
    }
    
    public func leftDown(_ leftLength:CGFloat,_ downLength:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x - leftLength, lastEndPoint.y + downLength)
    }
    
    public func leftUp(_ leftLength:CGFloat,_ upLength:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x - leftLength, lastEndPoint.y - upLength)
    }
    
    public func rightDown(_ rightLength:CGFloat,_ downLength:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x + rightLength, lastEndPoint.y + downLength)
    }
    
    public func rightUp(_ rightLength:CGFloat,_ upLength:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x + rightLength, lastEndPoint.y - upLength)
    }
    
    public func curve(_ to:Direction,_ type:CurveType) -> EasierPath {
        let start:CGPoint = lastEndPoint
        lastEndPoint = moveByDirection(lastEndPoint,to)
        switch type {
        case .quad(let controlDirection):
            self.path.addQuadCurve(to: lastEndPoint, controlPoint:moveByDirection(start,controlDirection))
        case .bezier(let controlDirection1, let controlDirection2):
            self.path.addCurve(to: lastEndPoint, controlPoint1: moveByDirection(start,controlDirection1), controlPoint2: moveByDirection(start,controlDirection2))
        }
        return EasierPath(self.path,lastEndPoint)
    }
    
    
    public func makeLayer(_ lineWidth:CGFloat,_ lineColor:UIColor,_ fillColor:UIColor) -> CAShapeLayer {
        let layer = EasierLayer()
        layer.layer.path = self.path.cgPath
        return layer.setStyle(lineWidth: lineWidth, lineColor: lineColor, fillColor: fillColor)
    }
    
    internal func moveByDirection(_ point:CGPoint,_ direction:Direction) -> CGPoint {
        switch direction {
        case .left(let length):
            return CGPoint(x:point.x - length,y:point.y)
        case .right(let length):
            return CGPoint(x:point.x + length,y:point.y)
        case .up(let length):
            return CGPoint(x:point.x,y:point.y-length)
        case .down(let length):
            return CGPoint(x:point.x,y:point.y + length)
        case .leftDown(let leftLength, let downLength):
            return CGPoint(x:point.x - leftLength,y:point.y + downLength)
        case .leftUp(let leftLength, let upLength):
            return CGPoint(x:point.x - leftLength,y:point.y - upLength)
        case .rightDown(let righLength, let downLength):
            return CGPoint(x:point.x + righLength,y:point.y + downLength)
        case .rightUp(let righLength, let upLength):
            return CGPoint(x:point.x + righLength,y:point.y - upLength)
        }
    }
    
    
    internal func addLine(_ x:CGFloat,_ y:CGFloat) -> EasierPath {
        lastEndPoint = CGPoint(x: x, y:y)
        self.path.addLine(to: lastEndPoint)
        self.layer.path = path.cgPath
        return EasierPath(self.path, lastEndPoint)
    }
    
}

