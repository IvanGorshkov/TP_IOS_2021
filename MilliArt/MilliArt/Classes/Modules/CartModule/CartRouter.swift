//
//  CartRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class CartRouter {
}

extension CartRouter: CartRouterInput {
    func goToCheckout(from vc: CartViewInput?, data: (rentArray: [RentPrice], buyArray: [BuyPrice])) {
        guard let view = vc as? UIViewController else { return }

        let newVC = InputContactContainer.assemble(with: InputContactContext(arr1: data.rentArray, arr2: data.buyArray))
        view.navigationController?.pushViewController(newVC.viewController, animated: true)
    }
}
