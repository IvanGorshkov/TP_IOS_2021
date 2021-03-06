//
//  PhoneFormatter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//

import UIKit

public protocol InputMaskProtocol {
    func formattedString(from plainString: String) -> String
    func mask(_ textField: UITextField, range: NSRange, replacementString string: String) -> Bool
}

final class PhoneFormatter {
        private var pattern: String
        
        private let digit: Character = "#"
        private let alphabetic: Character = "*"
        
        // MARK: - Lifecycle
        
        public init(pattern: String = "+# (###) ###-##-##") {
            self.pattern = pattern
        }
    
    public func formattedString(from plainString: String) -> String {
        guard !pattern.isEmpty else { return plainString }
        
        let pattern: [Character] = Array(self.pattern)
        let allowedCharachters = CharacterSet.alphanumerics
        let filteredInput = String(plainString.unicodeScalars.filter(allowedCharachters.contains))
        let input: [Character] = Array(filteredInput)
        var formatted: [Character] = []

        var patternIndex = 0
        var inputIndex = 0
        
        loop: while inputIndex < input.count {
            let inputCharacter = input[inputIndex]
            let allowed: CharacterSet
            
            guard patternIndex < pattern.count else { break loop }
            
            switch pattern[patternIndex] {
            case digit:
                allowed = .decimalDigits
            case alphabetic:
                allowed = .letters
            default:
                formatted.append(pattern[patternIndex])
                patternIndex += 1
                continue loop
            }
            
            guard inputCharacter.unicodeScalars.allSatisfy(allowed.contains) else {
                inputIndex += 1
                continue loop
            }
            
            formatted.append(inputCharacter)
            patternIndex += 1
            inputIndex += 1
        }
        
        return String(formatted)
    }
}

extension PhoneFormatter: InputMaskProtocol {
    public func mask(_ textField: UITextField, range: NSRange, replacementString string: String) -> Bool {
        let string = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        let formatted = formattedString(from: string)
        textField.text = formatted
        return formatted.isEmpty
    }
}
