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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpBase()
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
    private func doneClick() {
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
    func updateRentPrice() {
        let indexPosition = IndexPath(row: 2, section: 0)
        tableView.reloadRows(at: [indexPosition], with: .none)
    }

    func updateForSections() {
        activityIndicatorView.stopAnimating()
        output.sectionDelegate = self
        self.tableView.reloadData()
    }
}

extension ItemDescViewController: UITableViewDataSource {
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

extension ItemDescViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(output.getCellHeight(at: indexPath.row))
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
        self.output.goToAR()
    }

    func openFullScreen(silder: UIView) {
        output.openFullScreen(slider: silder)
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
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: "\(row + 1)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return attributedString
    }
}
