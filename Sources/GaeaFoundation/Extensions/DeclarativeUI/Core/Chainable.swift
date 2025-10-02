//
//  Chainable.swift
//  UIExample
//
//  Created by jjp3421 on 10/2/25.
//

protocol Chainable: AnyObject {}

extension Chainable {
    @discardableResult
    func apply(_ configure: (Self) -> Void) -> Self {
        configure(self)
        return self
    }
}
