//
//  ItemDescViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 28.10.1021.
//  
//

import UIKit
import ImageSlideshow
import NVActivityIndicatorView

final class ItemDescViewController: UIViewController {
	private let output: ItemDescViewOutput
    internal var tableView =  UITableView()
    internal var pickerView =  RentPickerView()
    
    private var section: SectionRowsRepresentable?
    private var activityIndicatorView: NVActivityIndicatorView!
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
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        output.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraintTableView()
        addConstraintPickerView()
    }
    
    
    private func setUp() {
        setUpBase()
        setUpTableView()
        setUpIndicator()
        setUpPickerView()
    }
    
    private func setUpPickerView() {
        self.view.addSubview(pickerView)
        self.pickerView.picker.dataSource = self
        self.pickerView.picker.delegate = self
        self.pickerView.button.addTarget(self, action: #selector(doneClick), for: .touchUpInside)
        self.pickerView.alpha = 0
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
    
    @objc
    func doneClick() {
        UIView.animate(withDuration: 0.1) {
            self.pickerView.alpha = 0
        }
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
    func updateRentPrice(_ sections: SectionRowsRepresentable) {
        guard let amount = self.section?.rows[2] as? AmountDescCellModel,
        let amount2 = sections.rows[2] as? AmountDescCellModel else { return }
        
        amount.countRent = amount2.countRent
        let indexPathRow:Int = 2
        let indexPosition = IndexPath(row: indexPathRow, section: 0)
        tableView.reloadRows(at: [indexPosition], with: .none)
    }
    
    func updateForSections(_ sections: SectionRowsRepresentable) {
        activityIndicatorView.stopAnimating()
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
    func openPicker() {
        UIView.animate(withDuration: 0.1) {
            self.pickerView.alpha = 1
        }

    }
    
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

extension ItemDescViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        output.changeMonthCount(value: row + 1)
    }
}
