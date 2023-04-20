//
//  CreateWalletSuccessView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import UIKit

protocol CreateWalletSuccessViewDelegate: AnyObject {
    func doneButtonDidTapped()
}

class CreateWalletSuccessView: UIView {

    weak var delegate: CreateWalletSuccessViewDelegate?

//    Your wallet has been created
//    you can use your wallet right now
    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetupUI

    private func setupUI() {
        backgroundColor = R.color.createWalletBackgroundColor()
        addSubviews([
            successImage,
            titleLabel,
            descriptionLabel,
            successButton
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        successImage.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(95)
            make.leading.equalToSuperview().offset(16)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(successImage.snp.bottom).offset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
        }

        successButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(48)
        }
    }

    // MARK: - Functions

    @objc private func tappedDoneButton() {
        delegate?.doneButtonDidTapped()
    }

    // MARK: - UIElements

    private lazy var successImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = R.image.createWalletSuccess()
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Your wallet is now backed up!"
        label.font = R.font.notoSansSemiBold(size: 28)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "You can use your wallet right now"
        label.font = R.font.notoSansRegular(size: 16)
        return label
    }()

    private lazy var successButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedDoneButton), for: .touchUpInside)
        return button
    }()
}
