//
//  BooklistTableCell.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/17.
//

import UIKit
import SnapKit

class BooklistTableCell: UITableViewCell {
    
    static let identifier = "BooklistTableCell"
    
    //MARK: - Property
    
    let bookImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_book_1")
        return image
    }()
    
    let booktitleLabel : UILabel = {
        let label = UILabel()
        label.text = "넛지"
        label.font = UIFont.NotoSansKR(type: .bold, size: 17)
        label.textColor = UIColor(white: 36.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let authorLabel : UILabel = {
        let label = UILabel()
        label.text = "리처드 H. 탈러"
        label.font = UIFont.NotoSansKR(type: .regular, size: 12)
        label.textColor = UIColor(white: 165.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let quotaitonLabel : UILabel = {
        let label = UILabel()
        label.text = "“"
        label.font = UIFont.NotoSansKR(type: .regular, size: 29)
        label.textColor = UIColor(red: 80.0 / 255.0, green: 65.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let numberofHighlightLabel : UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.NotoSansKR(type: .medium, size: 11)
        label.textColor = UIColor(red: 80.0 / 255.0, green: 65.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let highlightLabel : UILabel = {
        let label = UILabel()
        label.text = "개의 하이라이트"
        label.font = UIFont.NotoSansKR(type: .regular, size: 11)
        label.textColor = UIColor(red: 80.0 / 255.0, green: 65.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let describeLabel : UILabel = {
        let label = UILabel()
        label.text = "디폴트 옵션이 존재하지 않는다."
        label.font = UIFont.NotoSansKR(type: .regular, size: 14)
        label.textColor = UIColor(white: 85.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.text = "2021.02.04"
        label.font = UIFont.NotoSansKR(type: .regular, size: 12)
        label.textColor = UIColor(white: 165.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let shareBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .yellow
        btn.setImage(UIImage(named: "propIcShare"), for: UIControl.State.normal)
//        btn.setImage(UIImage(named: ""), for: UIControl.State.selected)
        return btn
    }()
    
    let likeBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .yellow
        btn.setImage(UIImage(named: "propIcLike"), for: UIControl.State.normal)
        btn.setImage(UIImage(named: "propIcLikeActive"), for: UIControl.State.selected)
        return btn
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245.0 / 255.0, green: 244.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bookImage)
        addSubview(booktitleLabel)
        addSubview(authorLabel)
        
        addSubview(quotaitonLabel)
        addSubview(numberofHighlightLabel)
        addSubview(highlightLabel)
        
        addSubview(describeLabel)
        addSubview(dateLabel)
        
        addSubview(shareBtn)
        addSubview(likeBtn)
        addSubview(lineView)
        
        bookImage.snp.makeConstraints { (make) in
            make.top.equalTo(16.5)
            make.leading.equalTo(25)
        }
        
        booktitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(12.5)
            make.leading.equalTo(bookImage.snp.trailing).offset(14)
        }
        
        authorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(booktitleLabel.snp.bottom).offset(1)
            make.leading.equalTo(bookImage.snp.trailing).offset(14)
        }
        
        quotaitonLabel.snp.makeConstraints { (make) in
            make.top.equalTo(authorLabel.snp.bottom).offset(8)
            make.leading.equalTo(bookImage.snp.trailing).offset(16)
        }
        
        numberofHighlightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(authorLabel.snp.bottom).offset(14)
            make.leading.equalTo(quotaitonLabel.snp.trailing).offset(1)
        }
        
        highlightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(authorLabel.snp.bottom).offset(16)
            make.leading.equalTo(numberofHighlightLabel.snp.trailing).offset(1)
        }
    
        describeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numberofHighlightLabel.snp.bottom).offset(11)
            make.leading.equalTo(bookImage.snp.trailing).offset(14)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(describeLabel.snp.bottom).offset(7)
            make.leading.equalTo(bookImage.snp.trailing).offset(14)
        }
        
//        shareBtn.snp.makeConstraints { (make) in
//            make.
//        }
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(bookImage.snp.bottom).offset(92.5)
            make.leading.equalTo(25)
            make.trailing.equalTo(-24)
            make.height.equalTo(1)
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
