//
//  TodoDataTableViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class TodoDataTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier = "TodoDataTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with todo: Todo) {
            titleLabel.text = todo.title
    }
    
}
