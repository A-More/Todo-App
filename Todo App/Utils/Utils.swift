//
//  Utils.swift
//  Todo App
//
//  Created by Akshay More on 19/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import Foundation
import UIKit
class Utils{
    
}

extension UIColor{
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIView{
    func applyGradient(startColor: UIColor, endColor: UIColor, x: CGPoint, y: CGPoint){
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor, endColor]
        //Use diffrent colors
        self.layer.addSublayer(gradientLayer)
    }
    
    func applyGradient(colours:[UIColor]){
        self.applyGradient(colours: colours, startPoint: CGPoint(x:0, y:0), endPoint: CGPoint(x:1, y:1))
    }
    
    func applyGradient(colours:[UIColor], startPoint: CGPoint, endPoint: CGPoint){
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colours
        gradientLayer.colors = colours.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.addSublayer(gradientLayer)
    }
}
