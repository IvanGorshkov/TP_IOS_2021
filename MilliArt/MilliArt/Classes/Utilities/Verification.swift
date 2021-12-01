//
//  Verification.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//

import Foundation

public protocol VerificationProtocol {
    func verify(from plainString: String) -> Bool
}

final class PhoneVerification: VerificationProtocol {
    func verify(from plainString: String) -> Bool {
        guard !plainString.isEmpty else { return false }
        return plainString.validPhoneNumber
    }
}

final class NameVerification: VerificationProtocol {
    func verify(from plainString: String) -> Bool {
        guard !plainString.isEmpty else { return false }
        return plainString.validFullName
    }
}

final class EmailVerification: VerificationProtocol {
    func verify(from plainString: String) -> Bool {
        guard !plainString.isEmpty else { return false }
        return plainString.validEmail
    }
}

final class AdressVerification: VerificationProtocol {
    func verify(from plainString: String) -> Bool {
        return plainString.validAdress
    }
}
