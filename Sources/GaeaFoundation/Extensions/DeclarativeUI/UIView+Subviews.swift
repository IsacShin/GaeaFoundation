//
//  UIView+Subviews.swift
//  UIExample
//
//  Created by jjp3421 on 10/2/25.
//

import UIKit

public extension UIView {
    @discardableResult
    func subviews(@SubviewBuilder _ builder: () -> [UIView]) -> Self {
        let views = builder()
        views.forEach { subview in
            self.addSubview(subview)
            subview.applyPendingConstraints()
        }
        return self
    }
}
