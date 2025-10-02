//
//  SubviewBuilder.swift
//  UIExample
//
//  Created by jjp3421 on 10/2/25.
//

import UIKit

@resultBuilder
struct SubviewBuilder {
    static func buildBlock(_ components: UIView...) -> [UIView] {
        components
    }
    
    static func buildOptional(_ component: [UIView]?) -> [UIView] {
        component ?? []
    }
    
    static func buildEither(first component: [UIView]) -> [UIView] {
        component
    }
    
    static func buildEither(second component: [UIView]) -> [UIView] {
        component
    }
    
    static func buildArray(_ components: [[UIView]]) -> [UIView] {
        components.flatMap { $0 }
    }
}
