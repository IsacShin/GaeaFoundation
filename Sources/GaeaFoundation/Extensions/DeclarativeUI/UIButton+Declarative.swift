//
//  UIButton+Declarative.swift
//  UIExample
//
//  Created by jjp3421 on 10/2/25.
//

import UIKit

public extension UIButton {
    
    // Associated key for action closure
    @MainActor private struct AssociatedKey {
        static var actionClosure: UInt8 = 0
    }
    
    // Action wrapper class
    private class ActionWrapper {
        let action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
        
        @objc func invoke() {
            action()
        }
    }
    
    @discardableResult
    func title(_ title: String, for state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor, for state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func font(size: CGFloat, weight: UIFont.Weight = .regular) -> Self {
        self.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: weight)
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ action: @escaping () -> Void) -> Self {
        let wrapper = ActionWrapper(action: action)
        objc_setAssociatedObject(self, &AssociatedKey.actionClosure, wrapper, .OBJC_ASSOCIATION_RETAIN)
        self.addTarget(wrapper, action: #selector(ActionWrapper.invoke), for: controlEvents)
        return self
    }
}
