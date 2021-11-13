//
//  FactoryForInput.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 13.11.2021.
//

import UIKit

protocol CreatorForInputDescription {
    func factoryVerification(with type: InputType) -> VerificationProtocol?
    func factoryFormater(with type: InputType) -> InputMaskProtocol?
}

final class  CreatorForInput: CreatorForInputDescription {
    private var textField: UITextField?
    
    func factoryFormater(with type: InputType) -> InputMaskProtocol? {
        switch type {
        case .name:
                return nil
        case .address:
                return nil
        case .email:
                self.textField?.keyboardType = .emailAddress
                self.textField?.autocapitalizationType = .none
                return nil
        case .tel:
                self.textField?.keyboardType = .phonePad
                return PhoneFormatter()
        default:
                return nil
        }
    }
    
    func factoryVerification(with type: InputType) -> VerificationProtocol? {
        switch type {
        case .name:
                return NameVerification()
        case .address:
                return AdressVerification()
        case .email:
                return EmailVerification()
        case .tel:
                return PhoneVerification()
        default:
                return nil
        }
    }
    
    init(textField: UITextField?) {
        self.textField = textField
    }
}
