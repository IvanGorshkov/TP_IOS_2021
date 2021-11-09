//
//  SectionViewCell.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 08.11.2021.
//

import UIKit
import ExpyTableView

final class SectionViewCell: BaseCell {
    internal var nameLabel = UILabel()
    internal var imageArrow = UIImageView()

    static let cellIdentifier = "CartSectionViewModel"

    override func updateViews() {
        guard let model = model as? CartSectionViewModel else {
            return
        }
        nameLabel.text = model.title
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [nameLabel, imageArrow].forEach({
            contentView.addSubview($0)
        })
        selectionStyle = .none
        addConstraintsName()
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBase()
        setUpLabel()
        setUpArrow()
    }

    private func setUpBase() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

    private func setUpLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.textColor = ColorConstants.BlackColor
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.heavy)
    }
    
    private func setUpArrow() {
        imageArrow.image = UIImage(named: "arrow")
    }
}

extension SectionViewCell: ExpyTableViewHeaderCell {
    func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {
        switch state {
        case .willExpand:
            arrowDown(animated: !cellReuse)
            
        case .willCollapse:
            arrowRight(animated: !cellReuse)
            
        case .didExpand: break
            
        case .didCollapse: break
        }
    }
    
    private func arrowDown(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0)) {
            self.imageArrow.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    private func arrowRight(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0)) {
            self.imageArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
}
