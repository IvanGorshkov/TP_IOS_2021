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
    var checkoutService: CheckOutServiceInput?
    var arr1 = [RentPrice]()
    var arr2 = [BuyPrice]()
    init() {
        checkoutService = CheckOutService(interactor: self)
    }
}

extension InputContactInteractor: InputContactInteractorInput {
    func checkout(with data: [CheckoutDataModel]) {
        checkoutService?.checkout(with: arr1, and: arr2, with: data)
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

extension InputContactInteractor: CheckOutServiceOutput {
    func faildCheckout() {
    }
    
    func successCheckout(with orederId: Int) {
         output?.resualtCheckout(error: nil, orderNumber: orederId)
    }
}
