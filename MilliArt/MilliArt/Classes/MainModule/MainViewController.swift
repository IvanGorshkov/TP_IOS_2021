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
	}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       //self.navigationController?.navigationBar.topItem?.title = "ads"
        setNavigationPicture()
    }
    
    private func setUp() {
        setNavigationPicture()
        self.view.backgroundColor = UIColor(red: CGFloat.random(in: 0..<1), green: CGFloat.random(in: 0..<1), blue: CGFloat.random(in: 0..<1), alpha: 1)
    }
    
    private func setNavigationPicture() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit

        let image = UIImage(named: "favicon")
        imageView.image = image

        navigationItem.titleView = imageView
    }
}

extension MainViewController: MainViewInput {
}
