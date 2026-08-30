//
//  UserAddressTableViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 06/08/2026.
//

import UIKit

class UserAddressTableViewCell: UITableViewCell {
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var geoLabel: UILabel!
    static let identifier = "UserAddressTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with user: User) {
        streetLabel.text = "Street: \( user.address.street ?? "")"
        suiteLabel.text = "Suite: \(user.address.suite ?? "")"
        cityLabel.text = "City: \(user.address.city ?? "")"
        zipcodeLabel.text = "Zipcode: \( user.address.zipcode ?? "")"
        geoLabel.text = "Geo: \(user.address.geo.lat ?? "") , \(user.address.geo.lng ?? "")"
    }
    
}
