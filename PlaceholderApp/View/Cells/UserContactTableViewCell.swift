//
//  UserContactTableViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class UserContactTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    static let identifier = "UserContactTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with user: User) {
        usernameLabel.text = "Username: \(user.username ?? "")"
        emailLabel.text = "Email: \(user.email ?? "")"
        phoneLabel.text = "Phone: \(user.phone ?? "")"
        websiteLabel.text = "Website: \(user.website ?? "")"
    }
    
}
