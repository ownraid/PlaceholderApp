//
//  UserTableViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    static let identifier = "UserTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with user: User) {
        nameLabel.text = user.name
    }
    
}
