//
//  CartViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit
import ExpyTableView

final class CartViewController: UIViewController {
	private let output: CartViewOutput
    internal var emptyCartView =  EmptyCartView()
    internal var tableView =  ExpyTableView()
    private var arr = [CartSectionViewModel]()
    
    init(output: CartViewOutput) {
        self.output = output
        arr.append(CartSectionViewModel(rows: [], title: "Аренда"))
        arr.append(CartSectionViewModel(rows: [], title: "Покупка"))
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [emptyCartView, tableView].forEach { [weak self] view in
            self?.view.addSubview(view)
        }
        setUp()
        output.viewDidLoad()
    }

    private func setUp() {
        setUpTableView()
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.CartNavTitle
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if output.isBasketEmpty() {
            self.emptyCartView.isHidden = false
            self.tableView.isHidden = true
        } else {
            self.emptyCartView.isHidden = true
            self.tableView.isHidden = false
        }
    }
}

extension CartViewController: CartViewInput {
    func loadData() {
        if output.isBasketEmpty() {
            self.emptyCartView.isHidden = false
            self.tableView.isHidden = true
        } else {
            self.emptyCartView.isHidden = true
            self.tableView.isHidden = false
        }
        
        tableView.reloadData()
        self.tableView.expand(0)
        self.tableView.expand(1)
    }
}

extension CartViewController: ExpyTableViewDataSource, ExpyTableViewDelegate {
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: output.getSectionIdentifier(section: section)) as? BaseCell else { return UITableViewCell() }
        cell.model = output.getSection(section: section)
        return cell
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return output.isExpandable(section: section)
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return output.getCountSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.getCountCells(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: output.getCellIdentifier(section: indexPath.section, row: indexPath.row)) as? BaseCell else { return UITableViewCell() }
        print(output.getCellIdentifier(section: indexPath.section, row: indexPath.row))
        cell.model = output.getCell(section: indexPath.section, row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
    }
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
    }
}
