//
//  commentTableViewCell.swift
//  Millie_iOS
//
//  Created by DYS on 2021/05/19.
//

import UIKit

class commentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timeAnddateLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    //@IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
