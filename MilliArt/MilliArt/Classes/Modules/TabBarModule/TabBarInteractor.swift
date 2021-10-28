//
//  TabBarInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

final class TabBarInteractor {
	weak var output: TabBarInteractorOutput?
}

extension TabBarInteractor: TabBarInteractorInput {
    func getTabBarItemsInfo() {
        output?.receiveTabBarItemsInfo(with: [
            TabBarItemModel(image: "TabMilliart", title: "Главная", selectedImage: "TabMilliart"),
            TabBarItemModel(image: "magnifyingglass", title: "Поиск", selectedImage: "magnifyingglass"),
            TabBarItemModel(image: "TabCart", title: "Корзина", selectedImage: "TabCart")
            ]
        )
    }
}
