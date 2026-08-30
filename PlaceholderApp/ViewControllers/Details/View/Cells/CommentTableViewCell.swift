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

}
