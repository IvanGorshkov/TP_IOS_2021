//
//  OrderViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.11.2021.
//  
//

import UIKit
import ExpyTableView

final class OrderViewController: UIViewController {
	private let output: OrderViewOutput
    internal var tableView = ExpyTableView()
    internal var thanksLabel = UILabel()
    internal var numberOrderLabel = UILabel()
    
    init(output: OrderViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [tableView, thanksLabel, numberOrderLabel].forEach { [weak self] view in
            self?.view.addSubview(view)
        }
        setUp()
        output.viewDidLoad()
	}
    
    private func setUp() {
        setUpTableView()
        setUpLabel(label: thanksLabel,
                   color: ColorConstants.BlackColor.withAlphaComponent(0.5),
                   fontSize: 36,
                   fontWeight: .bold,
                   text: "Спасибо за заказ")
        setUpLabel(label: numberOrderLabel,
                   color: ColorConstants.BlackColor.withAlphaComponent(0.6),
                   fontSize: 24,
                   fontWeight: .bold,
                   text: "№\(output.getOrderId())")
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
    
    private func setUpLabel(label: UILabel, color: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight, text: String) {
        label.numberOfLines = 0
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.text = text
        label.textAlignment = .center
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addViewConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

extension OrderViewController: OrderViewInput {
    func loadData() {
        tableView.reloadData()
        output.expand.expandifNeeded { section in
            self.tableView.expand(section)
        }
    }
}

extension OrderViewController: ExpyTableViewDataSource, ExpyTableViewDelegate {
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
