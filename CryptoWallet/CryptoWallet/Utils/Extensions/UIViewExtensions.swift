//
//  UIViewExtensions.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 21.03.23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}

// MARK: - Action

extension UIView {
    func addTapAction(_ action: @escaping () -> Void) {
        let tap = TapGestureRecognizerWithAction()
        tap.addAction(target: tap, action: action)
        addGestureRecognizer(tap)
    }

    private final class TapGestureRecognizerWithAction: UITapGestureRecognizer {
        private var action: (() -> Void)?

        func addAction(target: Any, action: @escaping () -> Void) {
            self.action = action
            addTarget(target, action: #selector(callAction))
        }

        @objc private func callAction() {
            action?()
        }
    }
}

// MARK: - Gradient

extension UIView {

    func applyGradient(colors: [UIColor?]) -> CAGradientLayer {
        let colors = colors.compactMap { $0 }
        return self.applyGradient(colors: colors, locations: nil)
    }

    func applyGradient(colors: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
