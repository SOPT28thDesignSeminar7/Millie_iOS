//
//  commentTableViewCell.swift
//  Millie_iOS
//
//  Created by DYS on 2021/05/19.
//

import UIKit

class commentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
