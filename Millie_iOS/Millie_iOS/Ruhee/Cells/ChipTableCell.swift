//
//  ChipTableCell.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/17.
//

import UIKit

class ChipTableCell: UITableViewCell {
    
    static let identifier = "ChipTableCell"
    
    //MARK: - Property
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
