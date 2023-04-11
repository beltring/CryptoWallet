//
//  PrivacyPolicyViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import UIKit

class PrivacyPolicyViewController: UIViewController, PrivacyPolicyViewProtocol {

    // MARK: - Public Properties

    public var presenter: PrivacyPolicyPresenterProtocol

    // MARK: - Init

    required init(presenter: PrivacyPolicyPresenterProtocol) {
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
        title = "Privacy Policy"
        view.backgroundColor = R.color.createWalletBackgroundColor()
        view.addSubview(textView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.arrowBackImage(),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(tappedCloseButton))
        navigationItem.leftBarButtonItem?.tintColor = R.color.createWalletBackColor()
        configureConstraints()
    }

    private func configureConstraints() {
        textView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.bottom.trailing.equalToSuperview().inset(16)
        }
    }

    // MARK: - Functions

    @objc private func tappedCloseButton() {
        presenter.backButtonDidTapped()
    }

    // MARK: - UIElement

    // swiftlint: disable line_length
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = R.font.notoSansRegular(size: 16)
        textView.textColor = R.color.createWalletBackColor()
        textView.backgroundColor = R.color.createWalletBackgroundColor()
        textView.text = """
Virtual Privacy AG or any related entity (the \"Company,\" \"we,\" or \"us\") would like to inform you on how we collect, use and disclose information. This Privacy Policy describes our practices in connection with information that we collect through websites operated by us from which you are accessing this Privacy Policy (the \"Websites\"); which may be accessed through HTML-formatted email message(s) that we send to you that link to this Privacy Policy. Collectively, we refer to the above as the \"Service.\"

        We take the protection of your personal data very seriously. By using the Service, you agree to the collection and use of information in accordance with this policy. We collect several different types of information for various purposes to provide and improve our Service to you.

        Contact Email
        When you send us an email we will store your provided personal information in order to process your inquiry and to provide you with our services to the extent applicable. We will keep copies of such communication as long as it is necessary for dealing with your inquiry.

        Tracking & Cookies Data
        We use cookies and similar tracking technologies to track the activity on our Service and hold certain information. Cookies are files with a small amount of data that our website stores on your device to collect and track information and to improve and analyze our Service.

        Changes to this Privacy Policy
        We may occasionally revise our privacy policy by posting the changes here.

        By accessing any part of the Websites or Service, you agree that you are providing your express consent to the terms and conditions of this Privacy Policy.

        Contact Details
        If you have further questions with regards to this privacy policy do not hesitate to contact us at hello@blockwallet.io with the subject line \"Privacy Policy\". The last changes were made: 2022.02.28

        Glitch effectGlitch effect
"""
        return textView
    }()
}
