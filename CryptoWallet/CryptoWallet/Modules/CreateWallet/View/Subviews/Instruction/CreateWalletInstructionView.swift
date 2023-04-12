//
//  CreateWalletInstructionView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 22.03.23.
//

import UIKit

protocol CreateWalletInstructionDelegate: AnyObject {
    func didTappedCreateWalletButton()
    func didTappedCloseButton()
}

class CreateWalletInstructionView: UIView {

    // MARK: - Public properties

    weak var delegate: CreateWalletInstructionDelegate?

    // MARK: - Private properties

    private var instructionsType = InstructionType.allCases

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
            closeButton,
            sharkImageView,
            headerInstructionsView,
            instructionsStackView,
            footerInstructionsView,
            createButton
        ])

        instructionsType.forEach { instructionType in
            let instructionView = InstructionView()
            instructionView.configure(viewModel: .init(image: instructionType.image,
                                                       title: instructionType.title,
                                                       description: instructionType.description))
            instructionsStackView.addArrangedSubview(instructionView)
        }
        configureConstraints()
    }

    private func configureConstraints() {
        closeButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.width.equalTo(24)
        }

        sharkImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(closeButton.snp.bottom).offset(9)
            make.height.width.equalTo(150)
        }

        headerInstructionsView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(sharkImageView.snp.bottom).offset(16)
        }

        instructionsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headerInstructionsView.snp.bottom).offset(32)
        }

        footerInstructionsView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(instructionsStackView.snp.bottom)
        }

        createButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(footerInstructionsView.snp.bottom).offset(48)
            make.bottom.equalToSuperview().inset(13)
        }
    }

    // MARK: - Functions

    @objc private func tappedCreateWalletButton() {
        delegate?.didTappedCreateWalletButton()
    }

    @objc private func tappedCloseButton() {
        delegate?.didTappedCloseButton()
    }

    // MARK: - UIElements

    private lazy var sharkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.sharkCreateImage()
        return imageView
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle(nil, for: .normal)
        button.setImage(R.image.closeImage(), for: .normal)
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        button.tintColor = R.color.createWalletBackColor()
        return button
    }()

    private lazy var headerInstructionsView = HeaderInstructionView()

    private lazy var footerInstructionsView = FooterInstructionView()

    private lazy var instructionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create a wallet", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = R.color.walletTitleColor()
        button.backgroundColor = R.color.endButtonColor()
        button.addTarget(self, action: #selector(tappedCreateWalletButton), for: .touchUpInside)
        return button
    }()
}
