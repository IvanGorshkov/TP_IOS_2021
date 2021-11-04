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
    internal var tableView =  UITableView()

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
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraintTableView()
    }
    
    
    internal func addConstraintTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        self.tableView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor).isActive = true
    }
    
    private func setUp() {
        setNavigationPicture()
        addNavigationButton()
        setUpTableView()
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
    }
    
    private func setUpTableView() {
        setUpTableViewBase()
        registerCells()
    }
    
    private func setUpTableViewBase() {
        self.view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.tableHeaderView = UIView()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    private func registerCells() {
        tableView.register(HeaderCellView.self, forCellReuseIdentifier: HeaderCellView.cellIdentifier)
        tableView.register(HorizontalCollectionViewCell.self, forCellReuseIdentifier: HorizontalCollectionViewCell.cellIdentifier)
        tableView.register(VerticalCollectionViewCell.self, forCellReuseIdentifier: VerticalCollectionViewCell.cellIdentifier)
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

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.getCountCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: output.getCellIdentifier(at: indexPath.row), for: indexPath) as! BaseCell
        cell.model = output.getCell(at: indexPath.row)
        cell.layoutSubviews()
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(output.getCellHeight(at: indexPath.row))
    }
}

