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
    
    let settingBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "icSetting"), for: .normal)
        return btn
    }()
    
    let profileImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imgProfile")
        return image
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = UIFont.NotoSansKR(type: .bold, size: 20)
        label.textColor = UIColor(white: 36.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let libraryLabel : UILabel = {
        let label = UILabel()
        label.text = "의 서재"
        label.font = UIFont.NotoSansKR(type: .regular, size: 20)
        label.textColor = UIColor(white: 36.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let followLabel : UILabel = {
        let label = UILabel()
        label.text = "팔로잉 0 • 팔로워 0"
        label.font = UIFont.NotoSansKR(type: .regular, size: 12)
        label.textColor = UIColor(white: 85.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let dayLabel : UILabel = {
        let label = UILabel()
        label.text = "43일째 "
        label.font = UIFont.NotoSansKR(type: .regular, size: 12)
        label.textColor = UIColor(white: 85.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let numberoffmillieLabel : UILabel = {
        let label = UILabel()
        label.text = "8"
        label.font = UIFont.NotoSansKR(type: .bold, size: 12) // 폰트 고쳐줘야 함
        label.textColor = UIColor(red: 171.0 / 255.0, green: 114.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let millieLabel : UILabel = {
        let label = UILabel()
        label.text = "밀리"
        label.font = UIFont.NotoSansKR(type: .regular, size: 12)
        label.textColor = UIColor(white: 85.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let moreBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "propIcMore"), for: .normal)
        return btn
    }()
    
    let starImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icStar")
        return image
    }()
    
    let favbookLabel : UILabel = {
        let label = UILabel()
        label.text = "   지금 나의 인생책"
        label.font = UIFont.NotoSansKR(type: .bold, size: 16)
        label.textColor = UIColor(white: 85.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let eunLabel : UILabel = {
        let label = UILabel()
        label.text = "   은?"
        label.font = UIFont.NotoSansKR(type: .regular, size: 16)
        label.textColor = UIColor(white: 85.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let findandchooseLabel : UILabel = {
        let label = UILabel()
        label.text = "내책장에서 선택해보세요"
        label.font = UIFont.NotoSansKR(type: .regular, size: 14)
        label.textColor = UIColor(white: 85.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let choosebookBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "btnChoosbook"), for: .normal)
        return btn
    }()

    
    //MARK: - UI
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(settingBtn)
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(libraryLabel)
        addSubview(followLabel)
        
        addSubview(dayLabel)
        addSubview(numberoffmillieLabel)
        addSubview(millieLabel)
        addSubview(moreBtn)
                
        addSubview(starImage)
        addSubview(favbookLabel)
        addSubview(eunLabel)
        addSubview(findandchooseLabel)
        addSubview(choosebookBtn)
    
        
        settingBtn.snp.makeConstraints { (make) in
            make.top.equalTo(-6)
            make.trailing.equalTo(-8)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(36)
            make.leading.equalTo(25)
            make.height.width.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(34)
            make.leading.equalTo(profileImage.snp.trailing).offset(10)
        }
        
        libraryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(34)
            make.leading.equalTo(nameLabel.snp.trailing).offset(-1)
        }
        
        followLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(2.6)
            make.leading.equalTo(profileImage.snp.trailing).offset(10.5)
        }
        
        dayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(followLabel.snp.bottom).offset(20.5)
            make.leading.equalTo(167.3)
        }
        
        numberoffmillieLabel.snp.makeConstraints { (make) in
            make.top.equalTo(followLabel.snp.bottom).offset(20.5) // 여기 폰트 가져오면 고쳐줘야 함
            make.leading.equalTo(dayLabel.snp.trailing).offset(0)
        }
        
        millieLabel.snp.makeConstraints { (make) in
            make.top.equalTo(followLabel.snp.bottom).offset(20.5)
            make.leading.equalTo(numberoffmillieLabel.snp.trailing).offset(-1)
        }
        
        moreBtn.snp.makeConstraints { (make) in
            make.top.equalTo(followLabel.snp.bottom).offset(22.5)
            make.leading.equalTo(millieLabel.snp.trailing).offset(35)
            make.width.height.equalTo(14)
        }
        
        starImage.snp.makeConstraints { (make) in
            make.leading.equalTo(25)
            make.bottom.equalTo(findandchooseLabel.snp.top).offset(-2)
        }
        
        favbookLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(starImage.snp.trailing).offset(-8)
            make.bottom.equalTo(findandchooseLabel.snp.top).offset(-0.02)
        }
        
        eunLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(favbookLabel.snp.trailing).offset(-11)
            make.bottom.equalTo(findandchooseLabel.snp.top).offset(-0.02)
        }

        findandchooseLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(25.3)
            make.bottom.equalTo(-40.4)
        }
        
        choosebookBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(-26.7)
            make.trailing.equalTo(-24.7)
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
