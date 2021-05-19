//
//  BooklistmenuTableCell.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/19.
//

import UIKit
import SnapKit

class BooklistmenuTableCell: UITableViewCell {
    
    static let identifier = "BooklistmenuTableCell"
    
    //MARK: - Property
    let booksLabel : UILabel = {
        let label = UILabel()
        label.text = "4권"
        label.font = UIFont.NotoSansKR(type: .medium, size: 13)
        label.textColor = UIColor(white: 165.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 223.0 / 255.0, alpha: 1.0)
        return view
    }()
    
    let countLabel : UILabel = {
        let label = UILabel()
        label.text = "13개"
        label.font = UIFont.NotoSansKR(type: .medium, size: 13)
        label.textColor = UIColor(white: 165.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let filterBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "btnfilter"), for: .normal)
        return btn
    }()
    
    //MARK: - UI
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(booksLabel)
        addSubview(lineView)
        addSubview(countLabel)
        addSubview(filterBtn)
        
        booksLabel.snp.makeConstraints { (make) in
            make.top.equalTo(9.5)
            make.leading.equalTo(25)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(14.5)
            make.leading.equalTo(booksLabel.snp.trailing).offset(3.5)
            make.width.equalTo(1)
            make.height.equalTo(11.5)
        }
        
        countLabel.snp.makeConstraints { (make) in
            make.top.equalTo(9.5)
            make.leading.equalTo(lineView.snp.trailing).offset(4.5)
        }
        
        filterBtn.snp.makeConstraints { (make) in
            make.top.equalTo(3.5)
            make.trailing.equalTo(-26)
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
