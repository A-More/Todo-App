//
//  Fontbook.swift
//  Todo App
//
//  Created by Akshay More on 19/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import Foundation
import UIKit
enum FontBook: String {
    case CircularBlackItalic    = "Circular-BlackItalic"
    case CircularBlack          = "Circular-Black"
    case CircularBoldItalic     = "Circular-BoldItalic"
    case CircularBold           = "Circular-Bold"
    case CircularBookItalic     = "Circular-BookItalic"
    case CircularBook           = "Circular-Book"
    case CircularMediumItalic   = "Circular-MediumItalic"
    case CircularMedium         = "Circular-Medium"
    
    func of(size: CGFloat) -> UIFont {
        var font = self.rawValue
//        if font == "Lato-BoldTest" {
//            font = "Lato-Bold"
//        }
        return UIFont(name: font, size: size)!
    }
}
