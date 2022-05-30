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
    
    lazy var easierPath = EasierPath(view.center.x + 100, view.center.y)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        easierPath
            .left(45)
            .down(90)
            .right(45)
            .curve(.up(90),
                   .quad(.rightUp(45,45)))
        
        view.layer.addSublayer(easierPath.makeLayer(3, .black, .green))
    }
}

