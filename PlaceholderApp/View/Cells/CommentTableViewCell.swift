//
//  CommentTableViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameandEmailBackgroundView: UIView!
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    static let identifier = "CommentTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with comment: Comment) {
        nameLabel.text = comment.name
        emailLabel.text = comment.email
        bodyLabel.text = comment.body
    }
    func configureUI(){
        nameandEmailBackgroundViewcard()
        mainBackgroundViewCard()
        
    }
    func nameandEmailBackgroundViewcard() {
        nameandEmailBackgroundView.layer.cornerRadius = 24
        nameandEmailBackgroundView.layer.masksToBounds = false
    }
    func mainBackgroundViewCard(){
        mainBackgroundView.layer.cornerRadius = 24
        mainBackgroundView.layer.shadowColor = UIColor.black.cgColor
        mainBackgroundView.layer.shadowOpacity = 0.10
        mainBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        mainBackgroundView.layer.shadowRadius = 8
        mainBackgroundView.layer.masksToBounds = false
    }
}
