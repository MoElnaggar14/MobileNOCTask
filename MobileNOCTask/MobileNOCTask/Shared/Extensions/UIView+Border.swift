//
//  UIView+Border.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/5/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set (newRadius) {
            self.layer.cornerRadius = newRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set (newWidth) {
            self.layer.borderWidth = newWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return (self.layer.borderColor != nil) ? UIColor(cgColor: self.layer.borderColor!) : nil
        }
        set (newColor) {
            self.layer.borderColor = newColor?.cgColor
        }
    }
    
    func addTopBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}
