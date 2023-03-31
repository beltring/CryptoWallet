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
        view.addSubviews([
            firstSeparator,
            secondSeparator,
            backUpLabel,
            backupDescription
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        firstSeparator.view.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view).inset(16)
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
        }

//        thirdSeparator.view.snp.makeConstraints { make in
//            make.leading.trailing.equalTo(view).inset(16)
//        }
    }

    // MARK: - UIElements

    private lazy var firstSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "portfolioTitleColor")
        return view
    }()

    private lazy var secondSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "portfolioTitleColor")
        return view
    }()

    private lazy var thirdSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "portfolioTitleColor")
        return view
    }()

    private lazy var backUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Backup"
        label.font = R.font.notoSansSemiBold(size: 20)
        label.textColor = UIColor(named: "portfolioTitleColor")
        return label
    }()

    private lazy var backupDescription: UILabel = {
        let label = UILabel()
        label.text = "Keep  a copy of your wallet in a safe place and never share it. Anyone who gets hold of your Backup file will be able to access your coins."
        label.numberOfLines = 0
        label.textColor = UIColor(named: "portfolioTitleColor")
        label.font = R.font.notoSansRegular(size: 16)
        return label
    }()

    private lazy var referralProgramButton: UIButton = {
        let button = UIButton()
        button.setTitle("Referral program", for: .normal)
        return button
    }()
}

extension SettingsViewController: SettingsViewProtocol {

}
