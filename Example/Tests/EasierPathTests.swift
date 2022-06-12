
import XCTest
@testable import EasierPath

class EasierPathTests: XCTestCase {
    
    var sut:EasierPath!

    override func setUpWithError() throws {
        sut = EasierPath(0,0)
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testEasierPath_WhenLeftMove_ShouldChangeLastEndPointToLeftMovePoint() {
        sut = EasierPath(0,0)
        let leftMove = sut.left(45)
        XCTAssertEqual(leftMove.lastEndPoint,CGPoint(x: -45, y: 0))
    }
    
    func testEasierPath_WhenRightMove_ShouldChangeLastEndPointToRightMovePoint() {
        sut = EasierPath(0,0)
        let rightMove = sut.right(45)
        XCTAssertEqual(rightMove.lastEndPoint,CGPoint(x: 45, y: 0))
    }
    
    func testEasierPath_WhenUpMove_ShouldChangeLastEndPointToUpMovePoint() {
        sut = EasierPath(0,0)
        let upMove = sut.up(45)
        XCTAssertEqual(upMove.lastEndPoint,CGPoint(x: 0, y: -45))
    }
    
    func testEasierPath_WhenDownMove_ShouldChangeLastEndPointToDownMovePoint() {
        sut = EasierPath(0,0)
        let downMove = sut.down(45)
        XCTAssertEqual(downMove.lastEndPoint,CGPoint(x: 0, y: 45))
    }
    
    func testEasierPath_WhenLeftUpMove_ShouldChangeLastEndPointToLeftUpMovePoint() {
        sut = EasierPath(0,0)
        let leftUpMove = sut.leftUp(45, 45)
        XCTAssertEqual(leftUpMove.lastEndPoint,CGPoint(x: -45, y: -45))
    }
    
    func testEasierPath_WhenRightUpMove_ShouldChangeLastEndPointToRightUpMovePoint() {
        sut = EasierPath(0,0)
        let rightUpMove = sut.rightUp(45, 45)
        XCTAssertEqual(rightUpMove.lastEndPoint,CGPoint(x: 45, y: -45))
    }
    
    func testEasierPath_WhenLeftDownMove_ShouldChangeLastEndPointToLeftDownMovePoint() {
        sut = EasierPath(0,0)
        let leftDownMove = sut.leftDown(45, 45)
        XCTAssertEqual(leftDownMove.lastEndPoint,CGPoint(x: -45, y: 45))
    }
    
    func testEasierPath_WhenRightDownMove_ShouldChangeLastEndPointToRightDownMovePoint() {
        sut = EasierPath(0,0)
        let rightDownMove = sut.rightDown(45, 45)
        XCTAssertEqual(rightDownMove.lastEndPoint,CGPoint(x: 45, y: 45))
    }
    
    func testEasierPath_WhenQuadCurveMove_ShouldChangeLastEndPointToQuadToPoint() {
        sut = EasierPath(0,0)
        let quadCurveMove = sut.curve(to:.up(45), .quad(.rightUp(45, 45)))
        XCTAssertEqual(quadCurveMove.lastEndPoint,CGPoint(x:0, y: -45))
    }
    
    func testEasierPath_WhenBezierCurveMove_ShouldChangeLastEndPointToQuadToPoint() {
        sut = EasierPath(0,0)
        
        let bezierCurveMove = sut.curve(to:.up(45), .bezier(.leftUp(45,45),.rightUp(45, 45)))
        XCTAssertEqual(bezierCurveMove.lastEndPoint,CGPoint(x:0, y: -45))
    }
    
    func testEasierPath_WhenMoveByDirection_ShouldReturnPointByDirection() {
        sut = EasierPath(0,0)
        let leftPoint = sut.moveByDirection(sut.lastEndPoint, .left(45))
        XCTAssertEqual(leftPoint,CGPoint(x:-45, y:0))
        let rightPoint = sut.moveByDirection(sut.lastEndPoint, .right(45))
        XCTAssertEqual(rightPoint,CGPoint(x:45, y:0))
        let upPoint = sut.moveByDirection(sut.lastEndPoint, .up(45))
        XCTAssertEqual(upPoint,CGPoint(x:0, y:-45))
        let downPoint = sut.moveByDirection(sut.lastEndPoint, .down(45))
        XCTAssertEqual(downPoint,CGPoint(x:0, y:45))
        let leftUpPoint = sut.moveByDirection(sut.lastEndPoint, .leftUp(45,45))
        XCTAssertEqual(leftUpPoint,CGPoint(x:-45, y:-45))
        let leftDownPoint = sut.moveByDirection(sut.lastEndPoint, .leftDown(45,45))
        XCTAssertEqual(leftDownPoint,CGPoint(x:-45, y:45))
        let rightUpPoint = sut.moveByDirection(sut.lastEndPoint, .rightUp(45, 45))
        XCTAssertEqual(rightUpPoint,CGPoint(x:45, y:-45))
        let rightDownPoint = sut.moveByDirection(sut.lastEndPoint, .rightDown(45, 45))
        XCTAssertEqual(rightDownPoint,CGPoint(x:45, y:45))
    }
}
