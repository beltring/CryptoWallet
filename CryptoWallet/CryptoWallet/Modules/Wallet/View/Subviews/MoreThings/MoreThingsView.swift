//
//  MoreThingsView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 21.03.23.
//

import UIKit

protocol MoreThingsViewDelegate: AnyObject {
    func didTapChooseThemeButton()
    func didTapContactButton()
    func didTapSettingsButton()
}

class MoreThingsView: UIView {

    // MARK: - Public properties

    weak var delegate: MoreThingsViewDelegate?

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
            titleLabel,
            mainStackView
        ])

        mainStackView.addArrangedSubviews([
            chooseThemeButton,
            contactSupportButton,
            settingButton
        ])

        configureConstraint()
    }

    private func configureConstraint() {
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }

        mainStackView.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(17)
        }
    }

    // MARK: - Functions

    @objc private func tappedChooseThemeButton() {
        delegate?.didTapChooseThemeButton()
    }

    @objc private func tappedContactSupportButton() {
        delegate?.didTapContactButton()
    }

    @objc private func tappedSettingsButton() {
        delegate?.didTapSettingsButton()
    }

    // MARK: - UIElements

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "More things"
        label.textColor = R.color.portfolioTitleColor()
        label.font = R.font.notoSansSemiBold(size: 20)
        return label
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        return stackView
    }()

    private lazy var chooseThemeButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = R.color.walletTitleColor()
        button.titleLabel?.font = R.font.notoSansRegular(size: 16)
        button.setTitle("Choose theme", for: .normal)
        button.setImage(R.image.chooseThemeImage(), for: .normal)
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 8)
        button.addTarget(self, action: #selector(tappedChooseThemeButton), for: .touchUpInside)
        return button
    }()

    private lazy var contactSupportButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = R.color.walletTitleColor()
        button.titleLabel?.font = R.font.notoSansRegular(size: 16)
        button.setTitle("Contact support", for: .normal)
        button.setImage(R.image.contactSupportImage(), for: .normal)
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 8)
        button.addTarget(self, action: #selector(tappedContactSupportButton), for: .touchUpInside)
        return button
    }()

    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = R.color.walletTitleColor()
        button.titleLabel?.font = R.font.notoSansRegular(size: 16)
        button.setTitle("Settings", for: .normal)
        button.setImage(R.image.settingImage(), for: .normal)
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 8)
        button.addTarget(self, action: #selector(tappedSettingsButton), for: .touchUpInside)
        return button
    }()
}
