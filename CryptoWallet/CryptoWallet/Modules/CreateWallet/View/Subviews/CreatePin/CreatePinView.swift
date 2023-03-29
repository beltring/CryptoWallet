//
//  CreatePinView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 27.03.23.
//

import UIKit

protocol CreatePinViewDelegate: AnyObject {
    func didEnterPasscode(code: String)
}

class CreatePinView: UIView {

    // MARK: - Properties

    private var countNumberOfInputs = 0
    private var prevCode = ""
    weak var delegate: CreatePinViewDelegate?

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
            subtitleLabel,
            passcodeView
        ])
        configureConstraints()
        countNumberOfInputs = 0
        passcodeView.delegate = self
    }

    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview()
        }

        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }

        passcodeView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(140)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
    }

    // MARK: - Configure

    func showKeyboardIfNeeded() {
        passcodeView.becomeFirstResponder()
    }

    // MARK: - UIComponents

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a pin"
        label.numberOfLines = 0
        label.textColor = R.color.createPinColor()
        label.font = R.font.notoSansSemiBold(size: 28)
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "So no one else but you can unlock your wallet"
        label.numberOfLines = 0
        label.textColor = R.color.portfolioTitleColor()
        label.font = R.font.notoSansRegular(size: 16)
        return label
    }()

    private lazy var passcodeView = PasscodeView()
}

// MARK: - PasscodeViewDelegate

extension CreatePinView: PasscodeViewDelegate {
    func didFinishedEnterCode(code: String) {

        if countNumberOfInputs == 0 {
            titleLabel.text = "Type your pin again"
            subtitleLabel.text = "There will be NO ‘Restore Pin’ button. Make sure you remember it."
            prevCode = code
            countNumberOfInputs += 1
            passcodeView.showKeyboardIfNeeded()
        } else if countNumberOfInputs == 1 && prevCode == code {
            countNumberOfInputs = 0
            passcodeView.resignFirstResponder()
            delegate?.didEnterPasscode(code: code)
        } else {
            titleLabel.text = "Create a pin"
            subtitleLabel.text = "So no one else but you can unlock your wallet"
            prevCode = ""
            countNumberOfInputs = 0
        }

    }
}
