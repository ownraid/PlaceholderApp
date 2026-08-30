//
//  PostTableViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    static let identifier = "PostTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with post: Post) {
        
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
