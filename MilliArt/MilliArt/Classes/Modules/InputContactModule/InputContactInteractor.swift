//
//  InputContactModuleInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//  
//

import Foundation

final class InputContactInteractor {
	weak var output: InputContactInteractorOutput?
    var arr1 = [RentPrice]()
    var arr2 = [BuyPrice]()
}

extension InputContactInteractor: InputContactInteractorInput {
    func checkout(with data: [CheckoutDataModel]) {
        output?.resualtCheckout(error: nil, orderNumber: 2448)
    }
    
    func getArrays() -> (rentArray: [RentPrice], buyArray: [BuyPrice]) {
        return (arr1, arr2)
    }
    
    func getInputs() -> [InputCheckoutModel] {
        return [
            InputCheckoutModel(inputType: .name, placeholder: TitlesConstants.FullNamePlaceholder),
            InputCheckoutModel(inputType: .tel, placeholder: TitlesConstants.PhonePlaceholder),
            InputCheckoutModel(inputType: .email, placeholder: TitlesConstants.MailPlaceholder),
            InputCheckoutModel(inputType: .address, placeholder: TitlesConstants.AddressPlaceholder)
        ]
    }
}
