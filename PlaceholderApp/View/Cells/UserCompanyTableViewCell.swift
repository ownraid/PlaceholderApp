//
//  UserCompanyTableViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 09/08/2026.
//

import UIKit

class UserCompanyTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    static let identifier = "UserCompanyTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with user: User) {
        nameLabel.text = "Name: \(user.company.name ?? "")"
        catchPhraseLabel.text = "Catch Phrase: \(user.company.catchPhrase ?? "")"
        bsLabel.text = "BS: \(user.company.bs ?? "")"
    }
    
}
