//
//  UIViewControllerExtension.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 28.03.23.
//

import UIKit

extension UIViewController {

    func hideNavBarLine() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
