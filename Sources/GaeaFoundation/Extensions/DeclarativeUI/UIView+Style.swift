//
//  UIView+Style.swift
//  UIExample
//
//  Created by jjp3421 on 10/2/25.
//

import UIKit

public extension UIView {
    // MARK: Background Color
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    // MARK: Corner Radius
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    // MARK: Border
    @discardableResult
    func border(width: CGFloat, color: UIColor) -> Self {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        return self
    }
    
    // MARK: Shadow
    @discardableResult
    func shadow(color: UIColor = .black, opacity: Float = 0.5, offset: CGSize = .zero, radius: CGFloat = 5) -> Self {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
        return self
    }
    
    // MARK: Alpha
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    
    // MARK: Hidden
    @discardableResult
    func hidden(_ isHidden: Bool = true) -> Self {
        self.isHidden = isHidden
        return self
    }
}
