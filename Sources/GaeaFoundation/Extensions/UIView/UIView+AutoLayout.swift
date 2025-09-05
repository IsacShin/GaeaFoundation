//
//  UIView+AutoLayout.swift
//  GaeaFoundation
//
//  Created by jjp3421 on 9/5/25.
//

import UIKit

// MARK: - ConstraintMaker

@MainActor
public final class ConstraintMaker {
    private let view: UIView
    fileprivate var constraints: [NSLayoutConstraint] = []
    private var lastCreatedConstraint: NSLayoutConstraint?

    public var constraint: NSLayoutConstraint {
        guard let constraint = lastCreatedConstraint else {
            fatalError("Could not find a constraint. Did you just create one?")
        }
        return constraint
    }

    fileprivate init(view: UIView) {
        self.view = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Anchors
    
    public var top: NSLayoutYAxisAnchor { view.topAnchor }
    public var bottom: NSLayoutYAxisAnchor { view.bottomAnchor }
    public var leading: NSLayoutXAxisAnchor { view.leadingAnchor }
    public var trailing: NSLayoutXAxisAnchor { view.trailingAnchor }
    public var centerX: NSLayoutXAxisAnchor { view.centerXAnchor }
    public var centerY: NSLayoutYAxisAnchor { view.centerYAnchor }
    public var width: NSLayoutDimension { view.widthAnchor }
    public var height: NSLayoutDimension { view.heightAnchor }

    // MARK: - Grouped Constraints
    
    @discardableResult
    public func center(in view: UIView, offset: CGPoint = .zero) -> Self {
        let centerXConstraint = self.view.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x)
        let centerYConstraint = self.view.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y)
        constraints.append(contentsOf: [centerXConstraint, centerYConstraint])
        lastCreatedConstraint = centerYConstraint
        return self
    }

    @discardableResult
    public func edges(to view: UIView, insets: UIEdgeInsets = .zero) -> Self {
        let topConstraint = self.view.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top)
        let leadingConstraint = self.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left)
        let trailingConstraint = self.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right)
        let bottomConstraint = self.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
        constraints.append(contentsOf: [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        lastCreatedConstraint = bottomConstraint
        return self
    }

    @discardableResult
    public func size(_ size: CGSize) -> Self {
        let widthConstraint = self.view.widthAnchor.constraint(equalToConstant: size.width)
        let heightConstraint = self.view.heightAnchor.constraint(equalToConstant: size.height)
        constraints.append(contentsOf: [widthConstraint, heightConstraint])
        lastCreatedConstraint = heightConstraint
        return self
    }
    
    @discardableResult
    public func size(_ side: CGFloat) -> Self {
        return size(CGSize(width: side, height: side))
    }

    // MARK: - Superview Constraints
    
    @discardableResult
    public func edgesToSuperview(insets: UIEdgeInsets = .zero) -> Self {
        guard let superview = view.superview else { return self }
        return edges(to: superview, insets: insets)
    }

    @discardableResult
    public func centerInSuperview(offset: CGPoint = .zero) -> Self {
        guard let superview = view.superview else { return self }
        return center(in: superview, offset: offset)
    }

    @discardableResult
    public func topToSuperview(constant: CGFloat = 0) -> Self {
        guard let superview = view.superview else { return self }
        return top(equalTo: superview.topAnchor, constant: constant)
    }

    @discardableResult
    public func bottomToSuperview(constant: CGFloat = 0) -> Self {
        guard let superview = view.superview else { return self }
        return bottom(equalTo: superview.bottomAnchor, constant: constant)
    }

    @discardableResult
    public func leadingToSuperview(constant: CGFloat = 0) -> Self {
        guard let superview = view.superview else { return self }
        return leading(equalTo: superview.leadingAnchor, constant: constant)
    }

    @discardableResult
    public func trailingToSuperview(constant: CGFloat = 0) -> Self {
        guard let superview = view.superview else { return self }
        return trailing(equalTo: superview.trailingAnchor, constant: constant)
    }

    @discardableResult
    public func centerXToSuperview(constant: CGFloat = 0) -> Self {
        guard let superview = view.superview else { return self }
        return centerX(equalTo: superview.centerXAnchor, constant: constant)
    }

    @discardableResult
    public func centerYToSuperview(constant: CGFloat = 0) -> Self {
        guard let superview = view.superview else { return self }
        return centerY(equalTo: superview.centerYAnchor, constant: constant)
    }

    // MARK: - Individual Constraints
    
    @discardableResult
    public func top(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        let constraint = view.topAnchor.constraint(equalTo: anchor, constant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func bottom(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        let constraint = view.bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func leading(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        let constraint = view.leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func trailing(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        let constraint = view.trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func centerX(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        let constraint = view.centerXAnchor.constraint(equalTo: anchor, constant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func centerY(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        let constraint = view.centerYAnchor.constraint(equalTo: anchor, constant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func width(equalTo constant: CGFloat) -> Self {
        let constraint = view.widthAnchor.constraint(equalToConstant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func height(equalTo constant: CGFloat) -> Self {
        let constraint = view.heightAnchor.constraint(equalToConstant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func width(equalTo anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> Self {
        let constraint = view.widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func height(equalTo anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> Self {
        let constraint = view.heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func width(greaterThanOrEqualToConstant constant: CGFloat) -> Self {
        let constraint = view.widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }
    
    @discardableResult
    public func height(greaterThanOrEqualToConstant constant: CGFloat) -> Self {
        let constraint = view.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraints.append(constraint)
        lastCreatedConstraint = constraint
        return self
    }

    fileprivate func activate() {
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - Extensions

extension UIView {
    private static var constraintsKey: UInt8 = 0
    
    internal var storedConstraints: [NSLayoutConstraint] {
        get { objc_getAssociatedObject(self, &Self.constraintsKey) as? [NSLayoutConstraint] ?? [] }
        set { objc_setAssociatedObject(self, &Self.constraintsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    public func makeConstraints(_ closure: (ConstraintMaker) -> Void) {
        let maker = ConstraintMaker(view: self)
        closure(maker)
        maker.activate()
        storedConstraints.append(contentsOf: maker.constraints)
    }

    public func updateConstraints(_ closure: (ConstraintMaker) -> Void) {
        let maker = ConstraintMaker(view: self)
        closure(maker)
        for newConstraint in maker.constraints {
            if let existing = storedConstraints.first(where: {
                $0.firstItem === newConstraint.firstItem &&
                $0.firstAttribute == newConstraint.firstAttribute &&
                $0.relation == newConstraint.relation
            }) {
                existing.constant = newConstraint.constant
            } else {
                newConstraint.isActive = true
                storedConstraints.append(newConstraint)
            }
        }
    }

    public func remakeConstraints(_ closure: (ConstraintMaker) -> Void) {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        makeConstraints(closure)
    }
}
