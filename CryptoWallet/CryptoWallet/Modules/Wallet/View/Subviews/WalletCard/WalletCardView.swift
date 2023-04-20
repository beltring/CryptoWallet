//
//  WalletCardView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 20.04.23.
//

import UIKit

protocol WalletCardViewProtocol: AnyObject {
    func tappedRecieveButton()
}

class WalletCardView: UIView {

    weak var delegate: WalletCardViewProtocol?

    // MARK: - Private Properties

    private var viewModel: ViewModel?

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
        addSubviews([
            backgroundImage,
            titleLabel,
            addressLabel,
            qrImageView,
            balanceLabel,
            recieveButton
        ])

        configureConstraints()
    }

    private func configureConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(16)
        }

        addressLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(130)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }

        qrImageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(addressLabel.snp.centerY)
            make.leading.equalTo(addressLabel.snp.trailing).offset(5)
        }

        balanceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(addressLabel.snp.bottom).offset(16)
        }

        recieveButton.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-24)
        }
    }

    // MARK: - Configure

    func configure(viewModel: ViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        addressLabel.text = viewModel.address
        balanceLabel.text = viewModel.balance
        backgroundImage.image = viewModel.backgroundImage
    }

    // MARK: - Fuctions

    @objc private func tappedRecieveButton() {
        delegate?.tappedRecieveButton()
    }

    // MARK: - UIElements

    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel?.title
        label.font = R.font.notoSansBold(size: 16)
        label.textColor = R.color.walletTitleColor()
        return label
    }()

    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel?.address
        label.font = R.font.notoSansRegular(size: 14)
        label.textColor = R.color.walletTitleColor()
        return label
    }()

    private lazy var qrImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = R.image.qrAccountImage()
        return image
    }()

    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.notoSansBold(size: 24)
        label.textColor = R.color.walletTitleColor()
        return label
    }()

    private lazy var recieveButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.setImage(R.image.recieveButtonImage(), for: .normal)
        button.addTarget(self, action: #selector(tappedRecieveButton), for: .touchUpInside)
        return button
    }()
}

// MARK: - ViewModels

extension WalletCardView {
    struct ViewModel {
        let title: String
        let backgroundImage: UIImage?
        let address: String
        let balance: String
    }
}
