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
        output.viewDidLoad()
        output.sectionDelegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addConstraintTableView()
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
        tableView.separatorStyle = .none
    }

    private func registerCells() {
        tableView.register(HeaderCellView.self, forCellReuseIdentifier: HeaderCellView.cellIdentifier)
        tableView.register(HCollectionViewTableViewCell.self, forCellReuseIdentifier: HCollectionViewTableViewCell.cellIdentifier)
        tableView.register(VCollectionViewTableViewCell.self, forCellReuseIdentifier: VCollectionViewTableViewCell.cellIdentifier)
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
    private func favoriteButtonAction() {
        output.itemSelected()
    }
}

extension MainViewController: MainViewInput {
}

extension MainViewController: TableViewCellOutput {
    func clickAllCompilation() {
        output.goToAllCompilation()
    }

    func clickAllAuthor() {
        output.goToAllAuthor()
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.getCountCells()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: output.getCellIdentifier(at: indexPath.row), for: indexPath)
                as? BaseCell else {
                    return UITableViewCell()
                }
        cell.model = output.getCell(at: indexPath.row)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(output.getCellHeight(at: indexPath.row))
    }
}
