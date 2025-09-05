//
//  UIPreviewProvider.swift
//  GaeaFoundation
//
//  Created by jjp3421 on 9/5/25.
//

import SwiftUI
import UIKit

#if DEBUG
public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    public let view: View

    public init(_ builder: @escaping () -> View) {
        view = builder()
    }

    public func makeUIView(context: Context) -> View {
        return view
    }

    public func updateUIView(_ uiView: View, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    public let viewController: ViewController

    public init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    public func makeUIViewController(context: Context) -> ViewController {
        return viewController
    }

    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}
#endif
