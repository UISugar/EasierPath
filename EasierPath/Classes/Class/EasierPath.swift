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
    
    public init() {
        self.path = UIBezierPath()
        lastEndPoint = CGPoint()
    }
    
    public init(_ shape:Shape,_ rect:CGRect) {
        self.path = Self.drawByShape(shape, rect)
        self.lastEndPoint = CGPoint(x: rect.maxX, y: rect.maxY)
    }
    
    public func start(_ x:CGFloat, _ y:CGFloat) -> EasierPath {
        self.path.move(to: CGPoint(x: x, y: y))
        self.lastEndPoint = CGPoint(x: x, y: y)
        return EasierPath(self.path, self.lastEndPoint)
    }
    
    @discardableResult
    public func left(_ length:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x - length, lastEndPoint.y)
    }
    
    @discardableResult
    public func right(_ length:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x + length, lastEndPoint.y)
    }
    
    @discardableResult
    public func up(_ length:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x, lastEndPoint.y - length)
    }
    
    @discardableResult
    public func down(_ length:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x, lastEndPoint.y + length)
    }
    
    @discardableResult
    public func leftDown(_ leftLength:CGFloat,_ downLength:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x - leftLength, lastEndPoint.y + downLength)
    }
    
    @discardableResult
    public func leftUp(_ leftLength:CGFloat,_ upLength:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x - leftLength, lastEndPoint.y - upLength)
    }
    
    @discardableResult
    public func rightDown(_ rightLength:CGFloat,_ downLength:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x + rightLength, lastEndPoint.y + downLength)
    }
    
    @discardableResult
    public func rightUp(_ rightLength:CGFloat,_ upLength:CGFloat) -> EasierPath {
        return addLine(lastEndPoint.x + rightLength, lastEndPoint.y - upLength)
    }
    
    @discardableResult
    public  func curve(to:Direction,_ type:CurveType) -> EasierPath {
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
    
    public func end() {
        self.path.close()
    }
    
    public func makeLayer(lineWidth:CGFloat,lineColor:UIColor,fillColor:UIColor) -> CAShapeLayer {
        let easierLayer = EasierLayer()
        easierLayer.layer.path = self.path.cgPath
        return easierLayer.setStyle(lineWidth: lineWidth, lineColor: lineColor, fillColor: fillColor)
    }
    
    public func makeGradientLayer(startPoint: CGPoint, endPoint: CGPoint, gradientColors: [CGColor]) -> CAGradientLayer {
        let easierLayer = EasierLayer()
        easierLayer.layer.path = self.path.cgPath
        easierLayer.gradientLayer.mask = easierLayer.layer
        return easierLayer.setGradientStyle(startPoint: startPoint, endPoint: endPoint, gradientColors: gradientColors)
    }
    
    static internal func drawByShape(_ shape:Shape,_ rect:CGRect) -> UIBezierPath {
        switch shape {
        //if rect's height is not equal to rect's width, the circle's radius will be rect's width
        case .circle:
          return UIBezierPath(arcCenter: CGPoint(x: rect.midX, y:rect.midY), radius:rect.size.width/2, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        case .oval:
            return UIBezierPath(ovalIn: rect)
        case .triangle:
            let bezierPath:UIBezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: rect.midX, y: rect.minY))
            bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            bezierPath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            bezierPath.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            return bezierPath
        case .rectangle:
            return UIBezierPath(rect: rect)
        //  //if rect's height is not equal to rect's width, the square's length will be rect's width
        case .square:
            return UIBezierPath(rect: CGRect(origin: rect.origin, size: CGSize(width: rect.width, height: rect.width)))
        case .rhombus:
            let bezierPath:UIBezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: rect.midX, y: rect.minY))
            bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            bezierPath.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            bezierPath.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            bezierPath.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            return bezierPath
        }
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

