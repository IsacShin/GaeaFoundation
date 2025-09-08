//
//  File.swift
//  GaeaFoundation
//
//  Created by shinisac on 9/8/25.
//

import SwiftUI

public extension View {
    /// SwiftUI로 구성된 메인 뷰를 가진 ViewContoller
    var hostingController: UIHostingController<Self> {
        return UIHostingController(rootView: self)
    }
    var uiView: UIView {
        return self.hostingController.view
    }
    
    /// iOS13 버전 onChange 대체
    func onChange<Value: Equatable>(
        of value: Value,
        perform action: @escaping (Value) -> Void
    ) -> some View {
        self.modifier(OnChangeModifier(value: value, action: action))
    }
    
    /// 뷰의 크기를 추적
    func observeSize(_ callback: @escaping (CGSize) -> Void) -> some View {
        self.background(
            GeometryReader { geo in
                Color.clear
                    .onAppear {
                        callback(geo.size)
                    }
                    .onChange(of: geo.size) { newSize in
                        callback(newSize)
                    }
            }
        )
    }
    
    /// ScrollView의 offset을 추적
    func observeScrollOffset(_ nameSpace: String? = nil, callback: @escaping (CGFloat) -> Void) -> some View {
        self.background(
            GeometryReader { geo in
                Color.clear
                    .preference(key: ScrollOffsetPreferenceKey.self,
                                value: nameSpace != nil ? geo.frame(in: .named(nameSpace!)).minY : geo.frame(in: .global).minY)
            }
        )
        .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: callback)
    }
    
}

private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private struct OnChangeModifier<Value: Equatable>: ViewModifier {
    let value: Value
    let action: (Value) -> Void
    @State private var oldValue: Value?
    
    func body(content: Content) -> some View {
        DispatchQueue.main.async {
            if oldValue != value {
                oldValue = value
                action(value)
            }
        }
        return content
    }
}
