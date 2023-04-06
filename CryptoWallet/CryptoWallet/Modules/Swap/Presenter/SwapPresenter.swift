//
//  SwapPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import Foundation
import XCoordinator

class SwapPresenter: SwapPresenterProtocol {

    // MARK: - Public Properties
    public weak var view: SwapViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<SwapRoute>

    // MARK: - Init
    public init(router: UnownedRouter<SwapRoute>) {
        self.router = router
    }
}
