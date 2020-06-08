//
//  UIFontExtension.swift
//  WireBarleyCodingTest
//
//  Created by 정유경 on 2020/06/08.
//  Copyright © 2020 yukyung. All rights reserved.
//

import UIKit

extension UIFont {
    
    // MARK: - 기기별 Font size
    class func dynamicFont(fontSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        let base: CGFloat = 812.0 // 11Pro, iphone X, XS => 5.8 inch
        
        let multiplier: CGFloat = height / base
        
        return systemFont(ofSize: size * multiplier, weight: weight)
    }
    
        
}

