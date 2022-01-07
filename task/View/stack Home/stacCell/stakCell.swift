//
//  stakCell.swift
//  task
//
//  Created by Mohamed Alfakharany on 06/01/2022.
//

import UIKit

class stakCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setItemLable (tile: Item) {
        titleLabel.text = tile.title ?? ""
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // for git hup the view for the selected state
    }
    
}
