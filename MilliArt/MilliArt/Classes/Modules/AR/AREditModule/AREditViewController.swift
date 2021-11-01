//
//  AREditViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//  
//

import UIKit

final class AREditViewController: UIViewController {
	private let output: AREditViewOutput
    internal var contentView = UIView()
    internal var done = UIButton()
    internal var imageView = UIImageView()
    
    init(output: AREditViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [contentView, done, imageView].forEach ({ [weak self] in self?.view.addSubview($0) })
        
        imageView.image = UIImage(named: "pic1")
        imageView.contentMode = .scaleAspectFit
        view.backgroundColor = ColorConstants.MainBackGroundColor
        contentView.backgroundColor = ColorConstants.DarkMainBackGroundColor
        done.backgroundColor = ColorConstants.MainPurpleColor
        done.setTitle("Применить", for: .normal)
        done.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        output.viewDidLoad()
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        done.layer.cornerRadius = done.frame.height / 2
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.imageView.backgroundColor = .gray
        self.done.translatesAutoresizingMaskIntoConstraints = false
       
        self.done.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        self.done.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        self.done.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.done.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        output.viewDidDisappear()
    }
}

extension AREditViewController: AREditViewInput {
}
