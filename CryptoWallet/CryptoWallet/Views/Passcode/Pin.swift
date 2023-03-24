//
//  Pin.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 24.03.23.
//


import UIKit

class Pin: UIView {

    let pin = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        pin.backgroundColor = .black
        pin.layer.cornerRadius = 10.0
        pin.layer.masksToBounds = true
        pin.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pin)
        pin.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(16)
        }
    }
}
