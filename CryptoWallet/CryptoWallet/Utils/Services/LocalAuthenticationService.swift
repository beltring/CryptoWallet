//
//  LocalAuthenticationService.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 28.03.23.
//

import Foundation
import LocalAuthentication

class LocalAuthenticationService {
    static let shared = LocalAuthenticationService()

    typealias AuthCompletionClosure = ((Bool) -> Void)

    private init() {}

    func biometricType() -> BiometricType {
        let authContext = LAContext()
        if #available(iOS 11, *) {
            guard authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) else {
                return .none
            }
            switch authContext.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touch
            case .faceID:
                return .face
            @unknown default:
                return .none
            }
        } else {
            return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touch : .none
        }

        return .none
    }
}
