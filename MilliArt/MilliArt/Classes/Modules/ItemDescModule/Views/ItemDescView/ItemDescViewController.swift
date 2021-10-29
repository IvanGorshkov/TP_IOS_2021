//
//  ItemDescViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.2021.
//  
//

import UIKit
import ImageSlideshow

final class ItemDescViewController: UIViewController {
	private let output: ItemDescViewOutput
    internal var tableView =  UITableView()
    private var section: SectionRowsRepresentable?
    
    init(output: ItemDescViewOutput) {
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
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraintTableView()
    }
    
    
    private func setUp() {
        setUpBase()
        setUpTableView()
    }
    
    private func setUpBase() {
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.BackNavTitle
        self.title = TitlesConstants.PaintingNavTitle
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
    }
    
    private func registerCells() {
        tableView.register(ItemNameCell.self, forCellReuseIdentifier: ItemNameCell.cellIdentifier)
        tableView.register(ItemSliderCell.self, forCellReuseIdentifier: ItemSliderCell.cellIdentifier)
        tableView.register(AmountDescCell.self, forCellReuseIdentifier: AmountDescCell.cellIdentifier)
        tableView.register(ButtonsDescCell.self, forCellReuseIdentifier: ButtonsDescCell.cellIdentifier)
        tableView.register(AboutDescCell.self, forCellReuseIdentifier: AboutDescCell.cellIdentifier)
        tableView.register(SpecificationsDescCell.self, forCellReuseIdentifier: SpecificationsDescCell.cellIdentifier)
    }
}

extension ItemDescViewController: ItemDescViewInput {
    func updateForSections(_ sections: SectionRowsRepresentable) {
        self.section = sections
        self.section?.delegate = self
        
        self.tableView.reloadData()
    }
}

extension ItemDescViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.section else { return 0 }
        return section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = self.section else { return UITableViewCell() }
        let model = section.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as! BaseCell
        cell.model = model
        
        return cell
    }
}

extension ItemDescViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = self.section else { return -1 }
        return CGFloat(section.rows[indexPath.row].cellHeight)
    }
}

extension ItemDescViewController: ItemDescCellViewOutput {
    func clickBuy() {
        print("clickBuy")
    }
    
    func clickRent() {
        print("clickRent")
    }
    
    func clickFav() {
        print("clickFav")
    }
    
    func clickAR() {
        print("clickAR")
    }
    
    func openFullScreen(silder: ImageSlideshow) {
        silder.presentFullScreenController(from: self)
    }
}
