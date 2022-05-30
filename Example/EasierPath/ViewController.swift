//
//  ViewController.swift
//  EasierPath
//
//  Created by 47676921 on 05/29/2022.
//  Copyright (c) 2022 47676921. All rights reserved.
//

import UIKit
import EasierPath

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        drawEasierPath()
        
        let bezierPath:UIBezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 100, y: 100))
        bezierPath.addLine(to: CGPoint(x: 200, y: 100))
        bezierPath.addCurve(to: CGPoint(x: 200, y: 300), controlPoint1: CGPoint(x: 250, y: 150), controlPoint2: CGPoint(x: 175, y: 250))
        bezierPath.addLine(to: CGPoint(x:100,y:300))
        bezierPath.addCurve(to: CGPoint(x: 100, y: 100), controlPoint1: CGPoint(x: 125, y: 250), controlPoint2: CGPoint(x: 50, y: 150))
        bezierPath.close()
        
        let caShapeLayer:CAShapeLayer = CAShapeLayer()
        caShapeLayer.path = bezierPath.cgPath
        caShapeLayer.strokeColor = UIColor.white.cgColor
        caShapeLayer.fillColor = UIColor.systemPink.cgColor
        caShapeLayer.lineWidth = 3
        
        view.layer.addSublayer(caShapeLayer)
        
    }
    
    func setupUI() {
        view.backgroundColor = .black
    }
    
    func drawEasierPath() {
        let easierPath = EasierPath(100,100)
            .right(100)
            .curve(to: .down(200), .bezier(.rightDown(50,50), .leftDown(25,150)))
            .left(100)
            .curve(to:.up(200), .bezier(.rightUp(25,50), .leftUp(50,150)))
        
        let layer = easierPath.makeLayer(lineWidth:3,lineColor: .white,fillColor:.systemPink)
        
        view.layer.addSublayer(layer)
    }
}

