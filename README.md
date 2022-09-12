# EasierPath ⚡️

[![CI Status](https://img.shields.io/travis/47676921/EasierPath.svg?style=flat)](https://travis-ci.org/47676921/EasierPath)
[![Version](https://img.shields.io/cocoapods/v/EasierPath.svg?style=flat)](https://cocoapods.org/pods/EasierPath)
[![License](https://img.shields.io/cocoapods/l/EasierPath.svg?style=flat)](https://cocoapods.org/pods/EasierPath)
[![Platform](https://img.shields.io/cocoapods/p/EasierPath.svg?style=flat)](https://cocoapods.org/pods/EasierPath)
![Platform](https://img.shields.io/badge/Coverage-100%25-green)

<img src="https://user-images.githubusercontent.com/47676921/171056957-309f97c1-c590-4b74-94e3-202641269d91.png"  width="600" height="300">

EasierPath is a library to make UIBezierPath easier to use. 
More specifically, you can write more intuitive and concise code when you draw a straight line or a curve.

# Why use EasierPath? 🤷

If you draw the shape of a jar using UIBezierPath, you will write the code as below.

![image](https://user-images.githubusercontent.com/47676921/171058476-b4788051-cf8f-49c2-98d8-2ea966e3add8.png)

### 1. Create a UIBezierPath instance and draw a line and connect it.

```swift
let bezierPath:UIBezierPath = UIBezierPath()
bezierPath.move(to: CGPoint(x: 100, y: 100))
bezierPath.addLine(to: CGPoint(x: 200, y: 100))
bezierPath.addCurve(to: CGPoint(x: 200, y: 300), controlPoint1: CGPoint(x: 250, y: 150), controlPoint2: CGPoint(x: 175, y: 250))
bezierPath.addLine(to: CGPoint(x:100,y:300))
bezierPath.addCurve(to: CGPoint(x: 100, y: 100), controlPoint1: CGPoint(x: 125, y: 250), controlPoint2: CGPoint(x: 50, y: 150))
bezierPath.close()
```

### 2. Apply the path of CAShapeLayer as UIBezierPath's cgPath and apply the desired style.

```swift
let caShapeLayer:CAShapeLayer = CAShapeLayer()
caShapeLayer.path = bezierPath.cgPath
caShapeLayer.strokeColor = UIColor.white.cgColor
caShapeLayer.fillColor = UIColor.systemPink.cgColor
caShapeLayer.lineWidth = 3
```

### 3. Add it to the subLayer of the view.

```swift
view.layer.addSublayer(caShapeLayer)
```

# UIBezierPath had several disadvantages in writing the above code. 😮‍💨

### 1. Remember the end point when adding lines in your head. 😵‍💫

Before drawing a line or curve, I had to remember where it ended and set the point accordingly.

The more we drew this, the more we had to remember, and it was so unclear to check through the code.

### 2. If the starting point changes, all points must be modified. 😓

Each line or the curved point is drawn based on the starting point, so if the starting point changed, you had to change the points of all the lines.

If you didn't want to do that, you could have used a certain variable to put the value and then designated it, but this was also a hassle.

### 3. Create CAShapeLayer or UIView. 😩

In order to display UIBezierPath in View, there was a hassle of applying the path created by creating CAShapeLayer, or creating a UIView and drawing it directly into the draw() method.

# Let's write a code using EasierPath to make the same shape of the jar below. 👊

![image](https://user-images.githubusercontent.com/47676921/171058476-b4788051-cf8f-49c2-98d8-2ea966e3add8.png)

### 1. Create and draw an instance of EasierPath.

```swift
let easierPath = EasierPath(100,100)
            .right(100)
            .curve(to: .down(200), .bezier(.rightDown(50,50), .leftDown(25,150)))
            .left(100)
            .curve(to:.up(200), .bezier(.rightUp(25,50), .leftUp(50,150)))
```

### 2. Make layers for the style you want.

```swift
let layer = easierPath.makeLayer(lineWidth:3,lineColor: .white,fillColor:.systemPink)
```

### 3. Add it to the subLayer of the view.

```swift
view.layer.addSublayer(layer)
```

# EasierPath can compensate for all of these shortcomings.😎

### 1. You don't have to remember the end point when adding a line. 😄

Using the above EasierPath, you don't have to remember where it ended before, just specify which direction to draw the line.

### 2. Even if the starting point changes, the code remains the same. 🤗

Even if the starting point changes, you do not need to change each point because it is drawn in a direction based on that point.

### 3. Create a layer using the makeLayer method. 🤩

You don't have to create a CAShapeLayer or UIView, but you can create a layer if you specify a style using the makeLayer method in EasierPath.

# You can also make the shapes you want simple 😋

```swift
   let shape = EasierPath(Shape, CGRect())
```

square | circle  | rectangle | oval | triangle | rhombus
:-------:|:-------:|:-------:|:-------:|:-------:|:-------:
![스크린샷 2022-06-12 오후 5 43 43](https://user-images.githubusercontent.com/47676921/173256519-0a70df62-be59-4897-8428-ff6e0d6e0aa6.png) | ![스크린샷 2022-06-12 오후 5 38 54](https://user-images.githubusercontent.com/47676921/173256447-6e1872dc-523d-46da-9d95-5ba1dd76d492.png)  | ![스크린샷 2022-06-12 오후 5 39 29](https://user-images.githubusercontent.com/47676921/173256449-dce242a5-e239-4801-9e38-ff180786d277.png) | ![스크린샷 2022-06-12 오후 5 39 15](https://user-images.githubusercontent.com/47676921/173256448-991ad589-f2eb-4738-b656-16c782a96d8c.png) | ![스크린샷 2022-06-12 오후 5 39 50](https://user-images.githubusercontent.com/47676921/173256452-903e0d8c-c9b5-4ac5-a046-89b87cb62d69.png) | ![스크린샷 2022-06-12 오후 5 38 36](https://user-images.githubusercontent.com/47676921/173256446-373decb9-a51d-4338-a727-c761df70452f.png)

# Easy to fill gradient colors to UIBezierPath 🌈

```swift
    let easierPath = EasierPath(100,600)
        .right(100)
        .curve(to: .down(200), .bezier(.rightDown(50,50), .leftDown(25,150)))
        .left(100)
        .curve(to:.up(200), .bezier(.rightUp(25,50), .leftUp(50,150)))
    let gradientLayer = easierPath.makeGradientLayer(startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), gradientColors: [UIColor.blue.cgColor,UIColor.red.cgColor])
```


<img src="https://user-images.githubusercontent.com/47676921/189566016-9829582b-e8fc-4c19-bd32-4af5318dbd04.png"  width="150" height="200">


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 13.0+
- Swift 5.0+

## Installation

EasierPath is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasierPath'
```

## Test Coverage

> 87.2%

## Author

Fomagran, fomagran6@naver.com

## License

EasierPath is available under the MIT license. See the LICENSE file for more info.
