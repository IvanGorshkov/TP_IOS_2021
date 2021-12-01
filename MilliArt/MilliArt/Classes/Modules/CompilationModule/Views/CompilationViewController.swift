//
//  CompilationViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.12.2021.
//  
//

import UIKit
import AVFoundation
import NVActivityIndicatorView

final class CompilationViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    private let output: CompilationViewOutput
    internal lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        return collectionView
    }()
    private var activityIndicatorView: NVActivityIndicatorView!
    
    init(output: CompilationViewOutput) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpBase()
    }
    
    private func setUp() {
        setUpBase()
        setUpcollectionViewBase()
        setUpIndicator()
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    private func setUpcollectionViewBase() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5)
        collectionView.register(VCollectionViewCell.self, forCellWithReuseIdentifier: VCollectionViewCell.cellIdentifier)
    }
    
    private func setUpBase() {
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.BackNavTitle
        self.navigationItem.title = output.getTitle()
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
    
    private func reloadLayout() {
        let layout = MosaicViewLayout()
        layout.delegate = self
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension CompilationViewController: CompilationViewInput {
    func reloadData() {
        activityIndicatorView.stopAnimating()
        collectionView.reloadData()
    }
}

extension CompilationViewController: UICollectionViewDataSource {
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
extension CompilationViewController: MosaicLayoutDelegate {
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
