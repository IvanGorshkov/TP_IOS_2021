//
//  SearchViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class SearchViewController: UIViewController {
	private let output: SearchViewOutput

    init(output: SearchViewOutput) {
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
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.SearchNavTitle
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
        addNavigationButton()
    }
    
    private func addNavigationButton() {
        let button = UIBarButtonItem(image: .init(named: "filter"), style: .plain, target: self, action: #selector(filterButtonAction))
        button.tintColor = ColorConstants.MainPurpleColor
        navigationItem.leftBarButtonItem = button
    }
    
    @objc
    func filterButtonAction () {
        output.goToFilter()
    }
}

extension SearchViewController: SearchViewInput {
}
