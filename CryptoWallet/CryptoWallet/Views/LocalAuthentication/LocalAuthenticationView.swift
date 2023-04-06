//
//  LocalAuthenticationView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 28.03.23.
//

import UIKit

protocol LocalAuthenticationViewDelegate: AnyObject {
    func didObtainError(error: String)
    func didTappedApprove()
}

class LocalAuthenticationView: UIView {

    // MARK: - Properties

    weak var delegate: LocalAuthenticationViewDelegate?

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - SetupUI

    private func setupUI() {
        addSubviews([
            typeAuthImage,
            title,
            subtitle,
            enableButton
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        typeAuthImage.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }

        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(typeAuthImage.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        subtitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(title.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        enableButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(subtitle.snp.bottom).offset(50)
            make.height.equalTo(50)
        }
    }

    // MARK: - Configure

    func configure(biometricType: BiometricType) {
        switch biometricType {
        case .none:
            delegate?.didObtainError(error: "Authentication error")
        case .touch:
            title.text = "Enable biometry unlock"
            subtitle.text = "Access SHARK wallet with your biometry. Quick, easy and secure."
            typeAuthImage.image = R.image.createWalletTouchIdImage()
            enableButton.setTitle("Enable biometry unlock", for: .normal)
        case .face:
            title.text = "Enable Face ID"
            subtitle.text = "Access SHARK wallet with Face ID. Quick, easy and secure."
            typeAuthImage.image = R.image.createWalletFaceIdImage()
            enableButton.setTitle("Enable Face ID", for: .normal)
        }
    }

    // MARK: - Functions

    @objc private func didTappedApproveButton() {
        delegate?.didTappedApprove()
    }

    // MARK: - UIElements

    private lazy var typeAuthImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = R.color.createWalletAuthTitleColor()
        label.font = R.font.notoSansSemiBold(size: 28)
        return label
    }()

    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = R.color.portfolioTitleColor()
        label.font = R.font.notoSansRegular(size: 16)
        return label
    }()

    private lazy var enableButton: UIButton = {
        let button = UIButton()
        button.setTitle("enable button", for: .normal)
        button.backgroundColor = R.color.endButtonColor()
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTappedApproveButton), for: .touchUpInside)
        return button
    }()
}
