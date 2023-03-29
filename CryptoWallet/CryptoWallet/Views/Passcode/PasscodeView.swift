//
//  PasscodeView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 24.03.23.
//

import UIKit

protocol PasscodeViewDelegate: AnyObject {
    func didFinishedEnterCode(code: String)
}

class PasscodeView: UIView, UITextInputTraits {

    // MARK: - Properties

    private var maxLength = 5
    private var code: String = "" {
        didSet {
            updateStack(by: code)
            if code.count == maxLength {
                self.resignFirstResponder()
                self.didFinishedEnterCode()
            }
        }
    }

    weak var delegate: PasscodeViewDelegate?
    var keyboardType: UIKeyboardType = .numberPad

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetupUI

    private func setupUI() {
        addSubview(stack)
        self.backgroundColor = .white
        stack.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        updateStack(by: code)
    }

    private func updateStack(by code: String) {
        var emptyPins = Array(0..<maxLength).map { _ in emptyPin() }
        let userPinLength = code.count
        let pins = Array(0..<userPinLength).map { _ in pin() }

        for (index, element) in pins.enumerated() {
            emptyPins[index] = element
        }
        stack.removeAllArrangedSubviews()
        for view in emptyPins {
            stack.addArrangedSubview(view)
        }
    }

    private func emptyPin() -> UIView {
        let pin = PinView()
        pin.showBorder()
        pin.setBackgroundColor(color: .clear)
        return pin
    }

    private func pin() -> UIView {
        let pin = PinView()
        pin.hideBorder()
        pin.setBackgroundColor(color: R.color.pinColor())
        return pin
    }

    // MARK: Functions

    override var canBecomeFirstResponder: Bool {
        return true
    }

    func showKeyboardIfNeeded() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showKeyboard))
        self.addGestureRecognizer(tapGesture)
    }

    @objc private func showKeyboard() {
        self.becomeFirstResponder()
    }

    private func didFinishedEnterCode() {
        code = ""
        self.becomeFirstResponder()
        delegate?.didFinishedEnterCode(code: code)
    }

    // MARK: - UIComponents

    let stack = UIStackView()
}

// MARK: - UIKeyInput

extension PasscodeView: UIKeyInput {
    var hasText: Bool {
        return code.count > 0
    }

    func insertText(_ text: String) {
        if code.count == maxLength {
            return
        }
        code.append(contentsOf: text)
    }

    func deleteBackward() {
        if hasText {
            code.removeLast()
        }
    }
}
