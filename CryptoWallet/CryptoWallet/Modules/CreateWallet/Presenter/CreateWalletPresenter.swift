//
//  CreateWalletPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 22.03.23.
//

import UIKit
import XCoordinator
import Firebase

class CreateWalletPresenter {
    // MARK: - Public Properties
    public weak var view: CreateWalletViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<CreateWalletRoute>

    // MARK: - Init
    public init(router: UnownedRouter<CreateWalletRoute>) {
        self.router = router
    }
}

// MARK: - CreateWalletPresenterProtocol

extension CreateWalletPresenter: CreateWalletPresenterProtocol {
    func closeButtonDidTapped() {
        router.trigger(.close)
    }

    func createWalletButtonDidTapped() {
        view?.showCreatePinView()
    }

    func presentErrorAlert(error: String) {
        router.trigger(.alert(title: "Error", message: error))
    }

    func saveCode(code: String) {
        KeychainService.shared.savePasscode(code: code)
    }

    func getkey() {
        let db = Firestore.firestore()
        db.collection("keys").getDocuments { [weak self] querySnapshot, err in
            if let error = err {
                self?.router.trigger(.alert(title: "Error", message: error.localizedDescription))
            } else {
                for document in querySnapshot!.documents {
                    print("\n MYLOG: \(document.documentID) => \(document.data())")
                }
            }
        }
    }
}
