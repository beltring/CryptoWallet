//
//  SettingsViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Public Properties
    public var presenter: SettingsPresenterProtocol

    // MARK: - Init

    required init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - SetupUI

    private func setupUI() {
        title = "Settings"
        navigationController?.setNavigationBarHidden(false, animated: false)
        tabBarController?.tabBar.selectedItem?.title = ""
        view.addSubviews([
            firstSeparator,
            secondSeparator,
            backUpLabel,
            backupDescription,
            referralProgramButton,
            thirdSeparator,
            telegramSupportButton,
            securityCenterButton,
            privacyPolicyButton
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        firstSeparator.view.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(1)
        }

        backUpLabel.snp.makeConstraints { make in
            make.top.equalTo(firstSeparator.snp.bottom).offset(24)
            make.leading.trailing.equalTo(view).inset(16)
        }

        backupDescription.snp.makeConstraints { make in
            make.top.equalTo(backUpLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(view).inset(16)
        }

        secondSeparator.view.snp.makeConstraints { make in
            make.top.equalTo(backupDescription.snp.bottom).offset(24)
            make.leading.trailing.equalTo(view).inset(16)
            make.height.equalTo(1)
        }

        referralProgramButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.top.equalTo(secondSeparator.snp.bottom).offset(24)
        }

        thirdSeparator.view.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(referralProgramButton.snp.bottom).offset(24)
            make.height.equalTo(1)
        }

        telegramSupportButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.top.equalTo(thirdSeparator.snp.bottom).offset(24)
        }

        securityCenterButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.top.equalTo(telegramSupportButton.snp.bottom).offset(24)
        }

        privacyPolicyButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.top.equalTo(securityCenterButton.snp.bottom).offset(24)
        }
    }

    // MARK: - Actions

    @objc private func tappedReferralProgramButton() {
        print("\n MYLOG: tappedReferralProgramButton")
    }

    @objc private func tappedTelegramSupportButton() {
        print("\n MYLOG: tappedTelegramSupportButton")
    }

    @objc private func tappedSecurityCenterButton() {
        print("\n MYLOG: tappedSecurityCenterButton")
    }

    @objc private func tappedPrivacyPolicyButton() {
        presenter.privacyPolicyButtonDidTapped()
    }

    // MARK: - UIElements

    private lazy var firstSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.portfolioTitleColor()
        return view
    }()

    private lazy var secondSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.portfolioTitleColor()
        return view
    }()

    private lazy var thirdSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.portfolioTitleColor()
        return view
    }()

    private lazy var backUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Backup"
        label.font = R.font.notoSansSemiBold(size: 20)
        label.textColor = R.color.createPinColor()
        return label
    }()

    private lazy var backupDescription: UILabel = {
        let label = UILabel()
        label.text = "Keep  a copy of your wallet in a safe place and never share it. Anyone who gets hold of your Backup file will be able to access your coins."
        label.numberOfLines = 0
        label.textColor = R.color.portfolioTitleColor()
        label.font = R.font.notoSansRegular(size: 16)
        return label
    }()

    private lazy var referralProgramButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(R.color.createPinColor(), for: .normal)
        button.setTitle("Referral program", for: .normal)
        button.setImage(UIImage(named: "refferalProgramImage"), for: .normal)
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 8)
        button.addTarget(self, action: #selector(tappedReferralProgramButton), for: .touchUpInside)
        return button
    }()

    private lazy var telegramSupportButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(R.color.createPinColor(), for: .normal)
        button.setTitle("Telegram support", for: .normal)
        button.setImage(UIImage(named: "telegramSupportImage"), for: .normal)
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 8)
        button.addTarget(self, action: #selector(tappedTelegramSupportButton), for: .touchUpInside)
        return button
    }()

    private lazy var securityCenterButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(R.color.createPinColor(), for: .normal)
        button.setTitle("Security center", for: .normal)
        button.setImage(UIImage(named: "securityCenterImage"), for: .normal)
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 8)
        button.addTarget(self, action: #selector(tappedSecurityCenterButton), for: .touchUpInside)
        return button
    }()

    private lazy var privacyPolicyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(R.color.createPinColor(), for: .normal)
        button.setTitle("Privacy Policy", for: .normal)
        button.setImage(UIImage(named: "securityCenterImage"), for: .normal)
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 8)
        button.addTarget(self, action: #selector(tappedPrivacyPolicyButton), for: .touchUpInside)
        return button
    }()
}

extension SettingsViewController: SettingsViewProtocol {

}
