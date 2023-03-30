//
//  PinView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 24.03.23.
//

import UIKit

class PinView: UIView {

    // MARK: - Properties

    private let pin = UIView()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetupUI

    private func setupUI() {
        pin.backgroundColor = .clear
        pin.layer.cornerRadius = 8
        pin.layer.masksToBounds = true
        addSubview(pin)
        pin.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(16)
        }
    }

    func showBorder() {
        pin.layer.borderColor = R.color.pinColor()?.cgColor
        pin.layer.borderWidth = 2
    }

    func hideBorder() {
        pin.layer.borderWidth = 0
    }

    func setBackgroundColor(color: UIColor?) {
        pin.backgroundColor = color
    }
}
