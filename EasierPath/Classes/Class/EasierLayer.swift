//
//  EasierLayer.swift
//  EasierPath
//
//  Created by Fomagran on 2022/05/29.
//

import UIKit

public class EasierLayer:EasierLayerProtocol {
    public var layer:CAShapeLayer = CAShapeLayer()
    
    init() {
        layer.fillColor = UIColor.white.cgColor
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 1
    }
    
    public func setStyle(lineWidth:CGFloat,lineColor:UIColor,fillColor:UIColor) -> CAShapeLayer {
        layer.lineWidth = lineWidth
        layer.strokeColor = lineColor.cgColor
        layer.fillColor = fillColor.cgColor
        return layer
    }
}
