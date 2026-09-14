//
//  TodoTableViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 02/08/2026.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DoneImage: UIImageView!
    static let identifier = "TodoTableViewCell"

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
        let isCompleted = todo.completed
        DoneImage.image = UIImage(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
    }
    
}
