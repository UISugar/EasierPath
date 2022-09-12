//
//  EasierLayerTests.swift
//  EasierPath_Tests
//
//  Created by Fomagran on 2022/05/29.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
@testable import EasierPath

class EasierLayerTests: XCTestCase {

    var sut:EasierLayer!

    override func setUpWithError() throws {
        sut = EasierLayer()
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testEasierPath_WhenSetStyle_ShouldReturnChangedStyleLayer() {

        let layer = sut.setStyle(lineWidth: 3, lineColor: .black, fillColor: .blue)
        
        XCTAssertEqual(layer.lineWidth,3)
        XCTAssertEqual(layer.strokeColor,UIColor.black.cgColor)
        XCTAssertEqual(layer.fillColor,UIColor.blue.cgColor)
    }
    
    func testEasierPath_WhenSetGradientStyle_ShouldReturnChangedGradientStyleLayer() {

        let gradientLayer = sut.setGradientStyle(startPoint: CGPoint(x: 0.5, y: 1.0), endPoint: CGPoint(x: 1.0, y: 1.0), gradientColors: [UIColor.blue.cgColor,UIColor.red.cgColor])
        
        XCTAssertEqual(gradientLayer.startPoint,CGPoint(x: 0.5, y: 1.0))
        XCTAssertEqual(gradientLayer.endPoint,CGPoint(x: 1.0, y: 1.0))
        XCTAssertEqual(gradientLayer.colors as! [CGColor],[UIColor.blue.cgColor,UIColor.red.cgColor])
    }

}
