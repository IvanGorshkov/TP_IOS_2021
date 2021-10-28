//
//  TabBarViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class TabBarViewController: UITabBarController {
	private let output: TabBarViewOutput

    init(output: TabBarViewOutput) {
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
        self.tabBar.tintColor = ColorConstants.MainPurpleColor
        self.tabBar.unselectedItemTintColor = ColorConstants.LightGrey
        self.tabBar.barTintColor = ColorConstants.TabBarColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.output.getViews()
    }
}

extension TabBarViewController: TabBarViewInput {
    
    func chooseSystemOrCustom(withName name: String) -> UIImage? {
        if let img = UIImage(systemName: name) {
            return img
        }
        return UIImage(named: name)
    }
    
    func receiveViews(with views: [UIViewController], tabBar: [TabBarItemModel]) {
        for i in 0..<views.count {
            let icon = UITabBarItem(title: tabBar[i].title, image: chooseSystemOrCustom(withName: tabBar[i].image), selectedImage: chooseSystemOrCustom(withName: tabBar[i].selectedImage))
            views[i].tabBarItem = icon
            views[i].tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)], for: .normal)
        }
        self.viewControllers = views.map {
            let nv = UINavigationController(rootViewController: $0)
            nv.navigationBar.tintColor = UIColor.white
            nv.navigationBar.barTintColor = ColorConstants.TabBarColor
            return nv
        }
    }
}
