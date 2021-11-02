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
    private var  arModel: ARViewModel?
    private var  frameArray: [FrameViewModel] = []
    private var selectedIndexPath: IndexPath? = nil
    
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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        [contentView, done, imageViewFrame, imageView, titleLabel, collectionView, frameWControl, frameRControl, frameWLabel, frameRLabel].forEach ({ [weak self] in self?.view.addSubview($0) })
        
        imageView.contentMode = .scaleAspectFit
        view.backgroundColor = ColorConstants.MainBackGroundColor
        contentView.backgroundColor = ColorConstants.DarkMainBackGroundColor
        done.backgroundColor = ColorConstants.MainPurpleColor
        done.setTitle(TitlesConstants.Apply, for: .normal)
        done.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        titleLabel.text = "Рамы"
        frameWLabel.text = "Толщина"
        frameRLabel.text = "Закругленность"
        frameRControl.maximumValue = 10
        frameWControl.maximumValue = 16
        frameRControl.minimumValue = 0
        frameWControl.minimumValue = 1
        frameWControl.stepValue = 2
        frameWControl.addTarget(self, action: #selector(frameValueChanged(_:)), for: .valueChanged)
        frameRControl.addTarget(self, action: #selector(frameValueChanged(_:)), for: .valueChanged)
        
        titleLabel.textColor = ColorConstants.BlackColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FrameCollectionCell.self, forCellWithReuseIdentifier: FrameCollectionCell.cellIdentifier)
        imageViewFrame.clipsToBounds = true
        output.viewDidLoad()
	}
    
    @objc func frameValueChanged(_ sender:UIStepper!)
      {
          output.setWAndRFrame(width: Float(frameWControl.value), raadius: Float(frameRControl.value))
          changeFrame()
      }
    
    private func changeFrame() {
        var imageContent = self.imageView.contentClippingRect.size;
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
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
         self.imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
       // self.imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -60).isActive = true
        //self.imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -60).isActive = true
        self.imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        
        self.done.translatesAutoresizingMaskIntoConstraints = false
       
        self.done.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        self.done.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        self.done.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.done.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        collectionView.backgroundColor = .clear
        
        
        frameWLabel.translatesAutoresizingMaskIntoConstraints = false
        frameWLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        frameWLabel.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 10).isActive = true
        
        frameRLabel.translatesAutoresizingMaskIntoConstraints = false
        frameRLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        frameRLabel.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 10).isActive = true
        
        
        frameWControl.translatesAutoresizingMaskIntoConstraints = false
        frameWControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        frameWControl.topAnchor.constraint(equalTo: self.frameWLabel.bottomAnchor, constant: 10).isActive = true
        
        frameRControl.translatesAutoresizingMaskIntoConstraints = false
        frameRControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        frameRControl.topAnchor.constraint(equalTo: self.frameRLabel.bottomAnchor, constant: 10).isActive = true
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        output.viewDidDisappear()
    }
}

extension AREditViewController: AREditViewInput {
    func loadARModel(model: ARViewModel?, frameArray: [FrameViewModel]) {
        self.arModel = model
        imageView.image = UIImage(named:  self.arModel?.ARpic ?? "")
        self.frameArray = frameArray
        collectionView.reloadData()
    }
}


extension AREditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.frameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FrameCollectionCell.cellIdentifier, for: indexPath) as? FrameCollectionCell else {
            return UICollectionViewCell()
        }
        
        cell.isSelected = selectedIndexPath == indexPath
        cell.model = frameArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndexPath != nil {
            if indexPath != selectedIndexPath {
                selectedIndexPath = indexPath
            }
        } else {
            selectedIndexPath = indexPath
        }
        output.frameDidSelect(index: indexPath.row)
        
        
        let contentOffset = self.collectionView.contentOffset
        collectionView.reloadData()
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        self.collectionView.setContentOffset(contentOffset, animated: false)
        imageViewFrame.image = UIImage(named: "art.scnassets/\(frameArray[indexPath.row].colorFrame)Color.jpg")
    }
}
