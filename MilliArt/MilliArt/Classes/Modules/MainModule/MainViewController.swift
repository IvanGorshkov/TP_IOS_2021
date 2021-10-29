//
//  MainViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit

final class MainViewController: UIViewController {
	private let output: MainViewOutput

    init(output: MainViewOutput) {
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.output.itemSelected()
        }
    }
    
    private func setUp() {
        setNavigationPicture()
        addNavigationButton()
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
    }
    
    private func addNavigationButton() {
        let button = UIBarButtonItem(image: .init(named: "fav"), style: .plain, target: self, action: #selector(favoriteButtonAction))
        button.tintColor = ColorConstants.MainPurpleColor
        navigationItem.rightBarButtonItem = button
    }
    
    private func setNavigationPicture() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit

        let image = UIImage(named: "favicon")
        imageView.image = image

        navigationItem.titleView = imageView
    }
    
    @objc
    func favoriteButtonAction() {
        
    }
}

extension MainViewController: MainViewInput {
}
