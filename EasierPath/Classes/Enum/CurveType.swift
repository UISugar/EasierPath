//
//  CurveType.swift
//  EasierPath
//
//  Created by Fomagran on 2022/05/29.
//

import UIKit

public enum CurveType {
    case quad(_ controlDirection:Direction)
    case bezier(_ controlDirection1:Direction,_ controlDirection2:Direction)
}
