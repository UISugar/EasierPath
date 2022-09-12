//
//  EasierLayer.swift
//  EasierPath
//
//  Created by Fomagran on 2022/05/29.
//

import UIKit

public class EasierLayer:EasierLayerProtocol {
    
    public var layer: CAShapeLayer = CAShapeLayer()
    public var gradientLayer: CAGradientLayer = CAGradientLayer()
    private let screenSize: CGRect = UIScreen.main.bounds
    private lazy var screenWidth = screenSize.width
    private lazy var screenHeight = screenSize.height
    
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
    
    func setGradientStyle(startPoint: CGPoint, endPoint: CGPoint, gradientColors: [CGColor]) -> CAGradientLayer {
        gradientLayer.frame = CGRect(origin: .zero, size: CGSize(width: screenWidth, height: screenHeight))
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = gradientColors
        return gradientLayer
    }
}
