//
//  BooklistTableCell.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/17.
//

import UIKit

class BooklistTableCell: UITableViewCell {
    
    static let identifier = "BooklistTableCell"
    
    //MARK: - Property
    
    let bookImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .orange
        return image
    }()
    
    let lineView : UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bookImage)
        
        bookImage.snp.makeConstraints { (make) in
            
        }
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
