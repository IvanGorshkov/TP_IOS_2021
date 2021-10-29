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
    private var tableView =  UITableView()
    var sections = [SectionRowsRepresentable]()
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUp()
    }
    
    
    private func setUp() {
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.BackNavTitle
        self.title = TitlesConstants.PaintingNavTitle
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.backgroundColor = .clear
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ItemNameCell.self, forCellReuseIdentifier: ItemNameCell.cellIdentifier)
        tableView.register(ItemSliderCell.self, forCellReuseIdentifier: ItemSliderCell.cellIdentifier)
        tableView.register(AmountDescCell.self, forCellReuseIdentifier: AmountDescCell.cellIdentifier)
        tableView.register(ButtonsDescCell.self, forCellReuseIdentifier: ButtonsDescCell.cellIdentifier)
        tableView.register(AboutDescCell.self, forCellReuseIdentifier: AboutDescCell.cellIdentifier)
        tableView.register(SpecificationsDescCell.self, forCellReuseIdentifier: SpecificationsDescCell.cellIdentifier)
        tableView.allowsSelection = false
        tableView.tableHeaderView = UIView()
        addConstraintTableView()
        output.viewDidLoad()
    }
    
    private func addConstraintTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor).isActive = true
    }
}

extension ItemDescViewController: ItemDescViewInput {
    func updateForSections(_ sections: [SectionRowsRepresentable]) {
        self.sections = sections
        self.sections[0].delegate = self
        
        self.tableView.reloadData()
    }
}

extension ItemDescViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as! BaseCell
        cell.loadSubViews()
        cell.model = model
        
        return cell
    }
}

extension ItemDescViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(sections[indexPath.section].rows[indexPath.row].cellHeight)
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
