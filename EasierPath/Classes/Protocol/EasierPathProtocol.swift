//
//  EasierPathProtocol.swift
//  EasierPath
//
//  Created by Fomagran on 2022/05/29.
//

import UIKit

protocol EasierPathProtocol {
    
    //MARK: Variables
    
    var lastEndPoint:CGPoint { get set }
    var path:UIBezierPath { get set }
    var layer:CAShapeLayer { get set }
    
    //MARK: Functions
    
    func moveByDirection(_ point:CGPoint,_ direction:Direction) -> CGPoint
    
    func left(_ length:CGFloat) -> EasierPath
    
    func right(_ length:CGFloat) -> EasierPath
    
    func up(_ length:CGFloat) -> EasierPath
    
    func down(_ length:CGFloat) -> EasierPath
    
    func leftDown(_ leftLength:CGFloat,_ downLength:CGFloat) -> EasierPath
    
    func leftUp(_ leftLength:CGFloat,_ upLength:CGFloat) -> EasierPath
    
    func rightDown(_ rightLength:CGFloat,_ downLength:CGFloat) -> EasierPath
    
    func rightUp(_ rightLength:CGFloat,_ upLength:CGFloat) -> EasierPath
    
    func curve(_ to:Direction,_ type:CurveType) -> EasierPath
    
    func makeLayer(_ lineWidth:CGFloat,_ lineColor:UIColor,_ fillColor:UIColor) -> CAShapeLayer
    
    func addLine(_ x:CGFloat,_ y:CGFloat) -> EasierPath
}
