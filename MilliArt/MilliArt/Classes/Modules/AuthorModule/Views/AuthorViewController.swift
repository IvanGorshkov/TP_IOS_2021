//
//  AuthorViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.12.2021.
//  
//

import UIKit
import AVFoundation

final class AuthorViewController: UIViewController, UICollectionViewDelegateFlowLayout {
	private let output: AuthorViewOutput
    internal let picture = UIImageView()
    internal let fullname = UILabel()
    internal let cityLabel = UILabel()
    internal let moreBtn = UIButton()
    internal let privateOrderBtn = UIButton()
    internal let interfaceSegmented = MUISegmentedControl()
    internal lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        return collectionView
    }()
    
    init(output: AuthorViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [picture, fullname, cityLabel, moreBtn, privateOrderBtn, interfaceSegmented, collectionView].forEach { [weak self] view in
            self?.view.addSubview(view)
        }
        
        setUp()
        output.viewDidLoad()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpBase()
    }
    
    private func setUp() {
        setUpLabel(label: fullname, fontSize: 20, color: ColorConstants.BlackColor)
        setUpLabel(label: cityLabel, fontSize: 14, color: ColorConstants.LightGrey)
        setUpButton(button: moreBtn, title: "Подробнее", selector: #selector(openAboutAuthor))
        setUpButton(button: privateOrderBtn, title: "Частный заказ", selector: #selector(sendMail))
        setUpPicture(imageView: picture)
        setUpSegmentedControl()
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
        setUpcollectionViewBase()
    }
    
    @objc
    private func sendMail() {
        output.sendMail()
    }
    
    @objc
    private func openAboutAuthor() {
        output.openAbout()
    }
    
    private func setUpBase() {
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.BackNavTitle
        self.navigationItem.title = TitlesConstants.AuthorTitle
    }
    
    private func setUpcollectionViewBase() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5)
        collectionView.register(VCollectionViewCell.self, forCellWithReuseIdentifier: VCollectionViewCell.cellIdentifier)
    }
    
    private func setUpLabel(label: UILabel, fontSize: CGFloat, color: UIColor) {
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
    }
    
    private func setUpButton(button: UIButton, title: String, selector: Selector) {
        button.setTitle(title, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = ColorConstants.MainPurpleColor.cgColor
        button.setTitleColor(ColorConstants.BlackColor, for: .normal)
        button.setTitleColor( .white, for: .highlighted)
        button.setTitleColor( .white, for: .selected)
        button.setBackgroundColor(color: ColorConstants.MainPurpleColor, forState: .highlighted)
        button.setBackgroundColor(color: ColorConstants.MainPurpleColor, forState: .selected)
        button.setBackgroundColor(color: .clear, forState: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        button.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    private func setUpPicture(imageView: UIImageView) {
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = ColorConstants.MainPurpleColor.cgColor
    }
    
    private func setUpSegmentedControl() {
        interfaceSegmented.setButtonTitles(buttonTitles: ["Все позиции", "В наличие"])
        interfaceSegmented.selectorViewColor = ColorConstants.MainPurpleColor
        interfaceSegmented.selectorTextColor =  ColorConstants.MainPurpleColor
        interfaceSegmented.backgroundColor = .clear
        interfaceSegmented.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addViewConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        [picture, moreBtn, privateOrderBtn].forEach { view in
            rounded(view: view)
        }
    }
    
    private func rounded(view: UIView) {
        view.layer.cornerRadius = view.frame.height / 2
        view.layer.masksToBounds = true
    }
    
    private func reloadLayout() {
        let layout = MosaicViewLayout()
        layout.delegate = self
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension AuthorViewController: AuthorViewInput {
    func setAuthorHeader(author: FullAuthor) {
        fullname.text = author.fullname
        cityLabel.text = author.city
        ImageLoader.shared.image(with: author.picture) { [weak self] image in
            self?.picture.image = image
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
        reloadLayout()
    }
}

extension AuthorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.getCountCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: output.getCellIdentifier(at: indexPath.row), for: indexPath)
                as? VCollectionViewCell else {
                    return UICollectionViewCell()
                }
        cell.configure(model: output.getCell(at: indexPath.row), complition: {
            let myCell = collectionView.cellForItem(at: indexPath)
            return cell == myCell
        })
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.itemSelected(id: indexPath.row)
    }
}

// MARK: MosaicLayoutDelegate
extension AuthorViewController: MosaicLayoutDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForImageAtIndexPath indexPath: IndexPath,
        withWidth width: CGFloat,
        complition: (CGFloat) -> Void) {
            let item = output.getCell(at: indexPath.row)
            guard let model = item as? VerticalPaintsModel else { return }
            let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
            let rect = AVMakeRect(aspectRatio:
                                    CGSize(
                                        width: CGFloat(model.width),
                                        height: CGFloat(model.heightArt)
                                    ), insideRect: boundingRect)
            complition(rect.height)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        heightForDescriptionAtIndexPath indexPath: IndexPath,
        withWidth width: CGFloat) -> CGFloat {
        let item = output.getCell(at: indexPath.row)
        guard let model = item as? VerticalPaintsModel else { return 0 }
        let descriptionHeight = heightForText(model.name, width: width-24)
        let height = 4 + 17 + 4 + descriptionHeight
        return height
    }
    
    func heightForText(_ text: String, width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 16)
        let rect = NSString(string: text).boundingRect(
            with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil)
        return ceil(rect.height)
    }
}

extension AuthorViewController: MUISegmentedControlDelegate {
    func change(to index: Int) {
        if interfaceSegmented.selectedIndex == index { return }
        output.changeSegament(index: index)
    }
}
