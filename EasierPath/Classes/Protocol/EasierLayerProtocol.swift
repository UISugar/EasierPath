//
//  EasierLayerProtocol.swift
//  EasierPath
//
//  Created by Fomagran on 2022/05/29.
//

import UIKit

protocol EasierLayerProtocol {
    
    //MARK:Variables
    
    var layer:CAShapeLayer { get set }
    
    //MARK: Functions
    
    func setStyle(lineWidth:CGFloat,lineColor:UIColor,fillColor:UIColor) -> CAShapeLayer
}

