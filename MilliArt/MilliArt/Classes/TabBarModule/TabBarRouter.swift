//
//  TabBarRouter.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class TabBarRouter {
    private var views:[UIViewController] = []
}

extension TabBarRouter: TabBarRouterInput {
    func getViews() -> [UIViewController] {
        views = [
            MainContainer.assemble(with: MainContext()).viewController,
            MainContainer.assemble(with: MainContext()).viewController,
            MainContainer.assemble(with: MainContext()).viewController
        ]
        return views
    }
}
