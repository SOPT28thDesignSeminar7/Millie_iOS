//
//  ChipCollectionCell.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/18.
//

import UIKit

class ChipCollectionCell: UICollectionViewCell {
    
    static let identifier = "ChipCollectionCell"
    
    //MARK: - Property
    
    let chipBtn : UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    //MARK: - UI
       
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(chipBtn)
        
        chipBtn.addTarget(self, action: #selector(test), for: .touchUpInside)
        
        chipBtn.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    
    @objc func test()
    {
        print("test Button Clicked")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

