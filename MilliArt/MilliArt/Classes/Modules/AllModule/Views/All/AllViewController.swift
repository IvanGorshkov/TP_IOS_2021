//
//  AllViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 05.11.2021.
//  
//

import UIKit
import AVFoundation

final class AllViewController: UIViewController, UICollectionViewDelegateFlowLayout {
	private let output: AllViewOutput
    internal lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        return collectionView
    }()

    init(output: AllViewOutput) {
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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addConstraintsCollectionView()
        reloadLayout()
    }

    private func setUp() {
        setUpBase()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5)
        collectionView.register(AllCollectionViewCell.self, forCellWithReuseIdentifier: AllCollectionViewCell.cellIdentifier)
    }
    private func setUpBase() {
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.BackNavTitle
        self.title = output.getTitle()
    }

    private func reloadLayout() {
        let layout = MosaicViewLayout()
        layout.delegate = self
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension AllViewController: AllViewInput {
    func reloadData() {
        collectionView.reloadData()
    }
}

extension AllViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.getCountCells()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllCollectionViewCell.cellIdentifier, for: indexPath)
                as? AllCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(model: output.getCell(at: indexPath.row))
        return cell
    }
}

// MARK: MosaicLayoutDelegate
extension AllViewController: MosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth width: CGFloat, complition: (CGFloat) -> Void) {
        let item = output.getCell(at: indexPath.row)
        guard let model = item as? HorizontalViewModel, let image = UIImage(named: model.pic) else { return }
       let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
        complition(rect.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForDescriptionAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let item = output.getCell(at: indexPath.row)
        guard let model = item as? HorizontalViewModel else { return 0 }
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
