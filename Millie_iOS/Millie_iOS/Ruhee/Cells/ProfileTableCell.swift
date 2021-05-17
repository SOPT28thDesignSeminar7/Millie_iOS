//
//  ProfileTableCell.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/17.
//

import UIKit
import SnapKit

class ProfileTableCell: UITableViewCell {
    
    static let identifier = "ProfileTableCell"
    
    //MARK: - Property
    
    let profileImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.image = UIImage(named: "imgProfile")
        return image
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let libraryLabel : UILabel = {
        let label = UILabel()
        label.text = "의 서재"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    let followLabel : UILabel = {
        let label = UILabel()
        label.text = "팔로잉 0 • 팔로워 0"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    //MARK: - UI
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImage)
        
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(36)
            make.leading.equalTo(25)
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
