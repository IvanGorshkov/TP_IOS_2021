//
//  TabBarInteractor.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import Foundation

import Firebase

final class TabBarInteractor {
	weak var output: TabBarInteractorOutput?
}

extension TabBarInteractor: TabBarInteractorInput {
    func getTabBarItemsInfo() {
        output?.receiveTabBarItemsInfo(with: [
            TabBarItemModel(image: "TabMilliart", title: TitlesConstants.MainBarTitle, selectedImage: "TabMilliart"),
            TabBarItemModel(image: "magnifyingglass", title: TitlesConstants.SearchBarTitle, selectedImage: "magnifyingglass"),
            TabBarItemModel(image: "TabCart", title: TitlesConstants.CartBarTitle, selectedImage: "TabCart")
            ]
        )
    }
}
