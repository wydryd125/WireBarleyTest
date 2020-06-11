//
//  CGFloatExtension.swift
//  WireBarleyCodingTest
//
//  Created by 정유경 on 2020/06/08.
//  Copyright © 2020 yukyung. All rights reserved.
//

import UIKit

extension CGFloat {
    
    static func dynamicWidth(width: CGFloat) -> CGFloat {
        let bounds = UIScreen.main.bounds
        let currentWidth = bounds.width
        let base: CGFloat = 375.0
        let multiplier = currentWidth / base
        let result = (width * multiplier)
        return result.rounded()
    }
    
    static func dynamicHeight(height: CGFloat) -> CGFloat {
        let bounds = UIScreen.main.bounds
        let currentHeight = bounds.size.height
        let base: CGFloat = 812.0 // 11Pro, iphone X, XS => 5.8 inch
        let multiplier = currentHeight / base
        let result = (height * multiplier)
        return result.rounded()
    }
    
}

