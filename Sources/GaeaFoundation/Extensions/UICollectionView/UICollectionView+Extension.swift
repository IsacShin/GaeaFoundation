//
//  UICollectionView+Extension.swift
//  GaeaFoundation
//
//  Created by jjp3421 on 9/5/25.
//

import UIKit

// MARK: - Register

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        let identifier = String(describing: cellType.self)
        register(cellType.self, forCellWithReuseIdentifier: identifier)
    }
    
    func registerHeader<T: UICollectionReusableView>(_ viewType: T.Type) {
        let identifier = String(describing: viewType.self)
        register(
            viewType.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: identifier
        )
    }
    
    func registerFooter<T: UICollectionReusableView>(_ viewType: T.Type) {
        let identifier = String(describing: viewType.self)
        register(
            viewType.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: identifier
        )
    }
}

// MARK: - Reusable

public extension UICollectionView {
    func reusableCell<T: UICollectionViewCell>(
        withReuseIdentifier identifier: String = String(describing: T.self),
        for indexPath: IndexPath
    ) -> T {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: identifier,
            for: indexPath
        ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }
        return cell
    }
    
    func reusableHeaderView<T: UICollectionReusableView>(
        withReuseIdentifier identifier: String = String(describing: T.self),
        for indexPath: IndexPath
    ) -> T {
        guard let header = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: identifier,
            for: indexPath
        ) as? T else {
            fatalError("Could not dequeue header with identifier: \(identifier)")
        }
        return header
    }
    
    func reusableFooterView<T: UICollectionReusableView>(
        withReuseIdentifier identifier: String = String(describing: T.self),
        for indexPath: IndexPath
    ) -> T {
        guard let footer = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: identifier,
            for: indexPath
        ) as? T else {
            fatalError("Could not dequeue footer with identifier: \(identifier)")
        }
        return footer
    }
}
