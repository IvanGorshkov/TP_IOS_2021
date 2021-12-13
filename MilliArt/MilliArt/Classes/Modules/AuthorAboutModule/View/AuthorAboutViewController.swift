//
//  AuthorAboutViewController.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 12.12.2021.
//  
//

import UIKit

final class AuthorAboutViewController: UIViewController {
	private let output: AuthorAboutViewOutput

    init(output: AuthorAboutViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal let picture = UIImageView()
    internal let fullname = UILabel()
    internal let interfaceSegmented = MUISegmentedControl()
    internal let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        [picture, fullname, interfaceSegmented, textView].forEach { [weak self] view in
            self?.view.addSubview(view)
        }
        
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpBase()
    }
    
    private func setUp() {
        setUpLabel(label: fullname, fontSize: 20, color: ColorConstants.BlackColor)
        setUpPicture(imageView: picture)
        setUpSegmentedControl()
        setUpDescription()
        self.view.backgroundColor = ColorConstants.MainBackGroundColor
        textView.text = output.getText(index: 0)
    }
    
    private func setUpBase() {
        self.navigationController?.navigationBar.topItem?.title = TitlesConstants.BackNavTitle
        self.navigationItem.title = TitlesConstants.AboutAuthorTitle
    }
    
    private func setUpLabel(label: UILabel, fontSize: CGFloat, color: UIColor) {
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        label.textAlignment = .center
        label.text = output.getFullName()
    }
    
    private func setUpPicture(imageView: UIImageView) {
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = ColorConstants.MainPurpleColor.cgColor
        ImageLoader.shared.image(with: output.getImage()) { image in
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFill
    }
    
    private func setUpDescription() {
        textView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.isSelectable = false
        textView.textColor = ColorConstants.BlackColor
    }
    
    private func setUpSegmentedControl() {
        interfaceSegmented.setButtonTitles(buttonTitles: ["Об авторе", "Выставки"])
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
        [picture].forEach { view in
            rounded(view: view)
        }
    }
    
    private func rounded(view: UIView) {
        view.layer.cornerRadius = view.frame.height / 2
        view.layer.masksToBounds = true
    }
}

extension AuthorAboutViewController: AuthorAboutViewInput {
}

extension AuthorAboutViewController: MUISegmentedControlDelegate {
    func change(to index: Int) {
        if interfaceSegmented.selectedIndex == index { return }
        textView.text = output.getText(index: index)
    }
}
