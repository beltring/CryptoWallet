//
//  FirebaseFirestoreManager.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 6.04.23.
//

import Foundation
import Firebase
import RNCryptor

class FirebaseFirestoreManager {

    typealias GetWordsCompletionClosure = ((String?, Error?) -> Void)

    static let shared = FirebaseFirestoreManager()

    private let db = Firestore.firestore()

    private init() {}

    func setWords() {
        guard let docId = UIDevice.current.identifierForVendor?.uuidString,
              let ecryptionKey = try? generateEncryptionKey()
        else {
            return
        }
        let words = UserDefaultsService.shared.getWords()
        let encryptWords = try? encryptMessage(message: words, encryptionKey: ecryptionKey)

        guard let encryptWords = encryptWords else { return }
        db.collection("keys").document(docId).setData(["words": encryptWords])
    }

    func getWords() -> String {
        db.collection("keys").getDocuments { [weak self] querySnapshot, _ in
            guard let documents = querySnapshot?.documents,
                  let docId = UIDevice.current.identifierForVendor?.uuidString else { return }
            let document = documents.first { $0.documentID ==  docId }
            let data = document?.data()
            let words = data?["words"] as? String
            let decryptWords = try? self?.decryptMessage(encryptedMessage: words ?? "", encryptionKey: docId)
        }
        return ""
    }

    // MARK: - Encryption

    private func generateEncryptionKey() throws -> String {
        guard let password = UIDevice.current.identifierForVendor?.uuidString
        else {
            return ""
        }
        let randomData = RNCryptor.randomData(ofLength: 32)
        let cipherData = RNCryptor.encrypt(data: randomData, withPassword: password)
        return cipherData.base64EncodedString()
    }

    func encryptMessage(message: String, encryptionKey: String) throws -> String {
        let messageData = message.data(using: .utf8)!
        let cipherData = RNCryptor.encrypt(data: messageData, withPassword: encryptionKey)
        return cipherData.base64EncodedString()
    }

    func decryptMessage(encryptedMessage: String, encryptionKey: String) throws -> String {

        let encryptedData = Data.init(base64Encoded: encryptedMessage)!
        let decryptedData = try RNCryptor.decrypt(data: encryptedData, withPassword: encryptionKey)
        let decryptedString = String(data: decryptedData, encoding: .utf8)!
        return decryptedString
    }
}
