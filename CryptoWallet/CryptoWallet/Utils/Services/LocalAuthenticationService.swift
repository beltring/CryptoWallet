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

    func callFaceId() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        //                        self?.unlockSecretMessage()
                        print("/n MY LOG: success")
                    } else {
                        print("/n MY LOG: error")
                    }
                }
            }
        } else {
            // no biometry
        }
    }
}
