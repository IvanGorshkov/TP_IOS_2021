//
//  InputContactModuleViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 11.11.2021.
//  
//

import UIKit

final class InputContactViewController: UIViewController {
	private let output: InputContactViewOutput
    internal let tableView = UITableView()
    internal var continueBtn = UIButton()
    init(output: InputContactViewOutput) {
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
        setUpTableViewBase()
        setUpButton()
        hideKeyboard()
        output.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraintTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        continueBtn.layer.cornerRadius = continueBtn.frame.height / 2
    }
    
    private func setUpButton() {
        self.view.addSubview(continueBtn)
        continueBtn.backgroundColor = ColorConstants.MainPurpleColor
        continueBtn.setTitle(TitlesConstants.Pay, for: .normal)
        continueBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        continueBtn.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
    }
    
    @objc
    private func continueAction() {
        var ok = true
        for item in (0..<output.getCountCells()) {
            guard let cell = tableView.cellForRow(at: IndexPath(row: item, section: 0)) as? ValidationCell else { continue }
            
            if !cell.validateCell() {
                ok = false
            }
        }
        guard ok == true else { return }
        var data = [CheckoutDataModel]()
        for item in (0..<output.getCountCells()) {
            guard let cell = tableView.cellForRow(at: IndexPath(row: item, section: 0)) as? InputCellOutput,
                  let model = cell.getDataInput() else { continue }
            data.append(model)
        }
        output.checkout(with: data)
    }
    
    private func setUp() {
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.BackNavTitle
        self.title = TitlesConstants.CheckOutTitle
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
    }
    
    private func setUpTableViewBase() {
        self.view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.tableFooterView?.frame.size.height = 200
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.cellIdentifier)
        tableView.register(TotalCellView.self, forCellReuseIdentifier: TotalCellView.cellIdentifier)
        tableView.register(TextViewCell.self, forCellReuseIdentifier: TextViewCell.cellIdentifier)
        tableView.register(ItemNameCell.self, forCellReuseIdentifier: ItemNameCell.cellIdentifier)
        tableView.register(RadioButtonCell.self, forCellReuseIdentifier: RadioButtonCell.cellIdentifier)
    }
}

extension InputContactViewController: InputContactViewInput {
    func updateTableView() {
        tableView.reloadData()
    }
}

extension InputContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.getCountCells()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: output.getCellIdentifier(at: indexPath.row),
            for: indexPath) as? BaseCell else {
                return UITableViewCell()
            }
        cell.model = output.getCell(at: indexPath.row)

        return cell
    }
}

extension InputContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(output.getCellHeight(at: indexPath.row))
    }
}

extension InputContactViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
       view.endEditing(true)
    }
}
