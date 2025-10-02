//
//  UIStackView+Declarative.swift
//  UIExample
//
//  Created by jjp3421 on 10/2/25.
//

import UIKit

public extension UIStackView {
    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    func arrangedSubviews(@SubviewBuilder _ builder: () -> [UIView]) -> Self {
        let views = builder()
        views.forEach { view in
            self.addArrangedSubview(view)
        }
        return self
    }
}
