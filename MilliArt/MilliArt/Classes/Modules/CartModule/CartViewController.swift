//
//  CartViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class CartViewController: UIViewController {
	private let output: CartViewOutput

    init(output: CartViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        self.navigationController?.navigationBar.topItem?.title = "Корзина"
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
    }
}

extension CartViewController: CartViewInput {
}
