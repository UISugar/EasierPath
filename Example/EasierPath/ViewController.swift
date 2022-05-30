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
    
    lazy var easierPath = EasierPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        drawEasierPath()
        
        view.layer.addSublayer(
            easierPath.makeLayer(
            lineWidth:3,
            lineColor: .white,
            fillColor:.systemPink)
        )
    }
    
    func drawEasierPath() {
        easierPath
            .start(100, 100)
            .curve(to: .right(200), .bezier(.rightUp(75, 50), .rightDown(150, 50)))
            .down(100)
            .curve(to:.left(200),.quad(.leftDown(100,50)))
            .up(100)
            .end()
    }
}

