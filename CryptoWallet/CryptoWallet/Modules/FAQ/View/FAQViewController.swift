//
//  FAQViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 12.04.23.
//

import UIKit

class FAQViewController: UIViewController, FAQViewProtocol {

    // MARK: - Public Properties

    public var presenter: FAQPresenterProtocol

    // MARK: - Init

    required init(presenter: FAQPresenterProtocol) {
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
        title = "FAQ"
        view.backgroundColor = R.color.createWalletBackgroundColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.arrowBackImage(),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(tappedCloseButton))
        navigationItem.leftBarButtonItem?.tintColor = R.color.createWalletBackColor()

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(faqStackView)
        scrollView.isExclusiveTouch = false
        scrollView.delaysContentTouches = false

        let faqCount = presenter.getFAQCount()

        for item in 0..<faqCount {
            let faq = presenter.getFAQ(index: item)
            let faqView = FAQView()
            faqView.configure(title: faq.title, description: faq.description)
            faqView.addTapAction {
                let isHidden = faqView.getIsHiddenView()
                faqView.configure(isExpanded: !isHidden)
            }
            faqStackView.addArrangedSubview(faqView)
        }

        configureConstraints()
    }

    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
        }

        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
        }

        faqStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }

    // MARK: - Functions

    @objc private func tappedCloseButton() {
        presenter.backButtonDidTapped()
    }

    // MARK: - UIElements

    private lazy var scrollView = UIScrollView()

    private lazy var contentView = UIView()

    private lazy var faqStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
}
