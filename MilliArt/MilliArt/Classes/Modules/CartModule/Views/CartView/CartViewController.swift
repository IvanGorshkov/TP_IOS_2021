//
//  CartViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit
import ExpyTableView
import NVActivityIndicatorView

final class CartViewController: UIViewController {
	private let output: CartViewOutput
    internal var emptyCartView =  EmptyCartView()
    internal var tableView =  ExpyTableView()
    internal var continueBtn = UIButton()
    private var activityIndicatorView: NVActivityIndicatorView!
    
    init(output: CartViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [emptyCartView, tableView, continueBtn].forEach { [weak self] view in
            self?.view.addSubview(view)
        }
        setUp()
    }

    private func setUp() {
        setUpTableView()
        setUpButton()
        setUpIndicator()
        self.title = TitlesConstants.CartNavTitle
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    private func setUpIndicator() {
        var frameCenter = view.center
        frameCenter.x -= 25
        frameCenter.y -= 25
        activityIndicatorView = NVActivityIndicatorView(
            frame: CGRect(origin: frameCenter, size: CGSize(width: 50, height: 50)),
            type: .ballScale,
            color: ColorConstants.MainPurpleColor)
    }
    
    private func setUpButton() {
        continueBtn.backgroundColor = ColorConstants.MainPurpleColor
        continueBtn.setTitle(TitlesConstants.Continue, for: .normal)
        continueBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        continueBtn.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
    }
    
    @objc
    private func continueAction() {
        output.goToCheckout()
    }

    private func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        self.tableView.tableFooterView = UIView()
        self.tableView.register(RentCellView.self, forCellReuseIdentifier: RentCellView.cellIdentifier)
        self.tableView.register(BuyCellView.self, forCellReuseIdentifier: BuyCellView.cellIdentifier)
        self.tableView.register(SectionViewCell.self, forCellReuseIdentifier: SectionViewCell.cellIdentifier)
        self.tableView.register(TotalCellView.self, forCellReuseIdentifier: TotalCellView.cellIdentifier)
        self.tableView.tableFooterView?.frame.size.height = 100
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addViewConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        continueBtn.layer.cornerRadius = continueBtn.frame.height / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewDidLoad()
        self.title = TitlesConstants.CartNavTitle
        if output.expand.isBasketEmpty() {
            self.emptyCartView.isHidden = false
            self.tableView.isHidden = true
            self.continueBtn.isHidden = true
        } else {
            self.emptyCartView.isHidden = true
            self.tableView.isHidden = false
            self.continueBtn.isHidden = false
        }
    }
}

extension CartViewController: CartViewInput {
    func loadData() {
        if output.expand.isBasketEmpty() {
            self.emptyCartView.isHidden = false
            self.tableView.isHidden = true
            self.continueBtn.isHidden = true
        } else {
            self.emptyCartView.isHidden = true
            self.tableView.isHidden = false
            self.continueBtn.isHidden = false
        }
        activityIndicatorView.stopAnimating()
        tableView.reloadData()
        output.expand.expandifNeeded { section in
            self.tableView.expand(section)
        }
    }
}

extension CartViewController: ExpyTableViewDataSource, ExpyTableViewDelegate {
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: output.expand.getSectionIdentifier(section: section)) as? BaseCell else { return UITableViewCell() }
        cell.model = output.expand.getSection(section: section)
        return cell
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return output.expand.isExpandable(section: section)
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return output.expand.getCountSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.expand.getCountCells(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: output.expand.getCellIdentifier(
                section: indexPath.section, row: indexPath.row)) as? BaseCell else { return UITableViewCell() }
        cell.model = output.expand.getCell(section: indexPath.section, row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
    }
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
    }
}
