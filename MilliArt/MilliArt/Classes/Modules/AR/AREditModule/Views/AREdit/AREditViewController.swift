//
//  AREditViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 01.11.2021.
//  
//

import UIKit
import Accelerate

final class AREditViewController: UIViewController {
	private let output: AREditViewOutput
    internal var contentView = UIView()
    internal var done = UIButton()
    internal var imageView = UIImageView()
    internal var imageViewFrame = UIImageView()
    internal var titleLabel = UILabel()
    internal var frameWControl = UIStepper()
    internal var frameRControl = UIStepper()
    internal var frameWLabel = UILabel()
    internal var frameRLabel = UILabel()
    internal var collectionView: UICollectionView!

    init(output: AREditViewOutput) {
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

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        output.viewDidDisappear()
    }

    private func setUp() {
        setUpViews()
        setUpLabel(label: frameRLabel, text: TitlesConstants.frameRadius)
        setUpLabel(label: frameWLabel, text: TitlesConstants.frameWidth)
        setUpLabel(label: titleLabel, text: TitlesConstants.frameLabel)
        setUpButton()
        setUpStepper(stepper: frameRControl, min: 0, max: 10)
        setUpStepper(stepper: frameWControl, min: 1, max: 20, step: 2)
        setUpCollectionView()
        setUpImageViews()

        [contentView, done, imageViewFrame,
         imageView, titleLabel, collectionView,
         frameWControl, frameRControl, frameWLabel,
         frameRLabel].forEach({ [weak self] in
            self?.view.addSubview($0)
        })
    }

    private func setUpViews() {
        view.backgroundColor = ColorConstants.MainBackGroundColor
        contentView.backgroundColor = ColorConstants.DarkMainBackGroundColor
    }

    private func setUpImageViews() {
        imageView.contentMode = .scaleAspectFit
        imageViewFrame.clipsToBounds = true
    }

    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FrameCollectionCell.self, forCellWithReuseIdentifier: FrameCollectionCell.cellIdentifier)
    }

    private func setUpStepper(stepper: UIStepper, min: Double, max: Double, step: Double = 1) {
        stepper.minimumValue = min
        stepper.maximumValue = max
        stepper.stepValue = step
        stepper.addTarget(self, action: #selector(frameValueChanged), for: .valueChanged)
    }

    private func setUpButton() {
        done.backgroundColor = ColorConstants.MainPurpleColor
        done.setTitle(TitlesConstants.Apply, for: .normal)
        done.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        done.addTarget(self, action: #selector(saveDataAndExit), for: .touchUpInside)
    }

    private func setUpLabel(label: UILabel, text: String) {
        label.textColor = ColorConstants.BlackColor
        label.text = text
    }

    @objc
    private func frameValueChanged() {
          output.setWAndRFrame(width: Float(frameWControl.value), raadius: Float(frameRControl.value))
          changeFrame()
    }

    @objc
    private func saveDataAndExit() {
        output.saveDataAndExit()
    }

    private func changeFrame() {
        var imageContent = self.imageView.contentClippingRect.size
        imageContent.width += 20 + frameWControl.value
        imageContent.height += 20 + frameWControl.value
        imageViewFrame.frame.size = imageContent
        imageViewFrame.center = imageView.center
        imageViewFrame.layer.cornerRadius = frameRControl.value  * 2
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        done.layer.cornerRadius = done.frame.height / 2
        changeFrame()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraintsAREdit()
    }

    private func setImageView(with imageview: UIImageView, named name: String) {
        imageview.image = UIImage(named: name)
    }

    private func reloadData() {
        let contentOffset = self.collectionView.contentOffset
        collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        self.collectionView.setContentOffset(contentOffset, animated: false)
    }

    private func setSteperData(with stepper: UIStepper, value: Double) {
        stepper.value = value
    }
}

extension AREditViewController: AREditViewInput {
    func updateFrames() {
        setImageView(with: imageViewFrame, named: output.getMaterail())
        reloadData()
    }

    func initFrames() {
        setImageView(with: imageView, named: output.getPicture())
        setImageView(with: imageViewFrame, named: output.getMaterail())

        setSteperData(with: frameRControl, value: output.getFrameRouned())
        setSteperData(with: frameWControl, value: output.getFrameWidth())

        reloadData()
    }
}

extension AREditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  output.countItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FrameCollectionCell.cellIdentifier, for: indexPath)
                as? FrameCollectionCell else {
                    return UICollectionViewCell()
                }

        cell.model = output.item(at: indexPath.row)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.frameDidSelect(index: indexPath.row)
        setImageView(with: imageViewFrame, named: output.frame(at: indexPath.row))
    }
}
