//
//  MainCollectionViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    static let identifier = "MainCollectionViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var View2Background: UIView!
    @IBOutlet weak var view3Background: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()

        // Initialization code
    }
    func configureUI() {
        //configureCard(View2Background)
        //configureCard(view3Background)

    }
    func configureCard(_ view : UIView) {
        view.layer.cornerRadius = 24
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        view.layer.masksToBounds = false
    }
    
    func configure(with item: mainMenuItem) {

        titleLabel.text = "Label Label Label Label "
        iconImageView.image = UIImage(systemName: item.image)
    }

}
