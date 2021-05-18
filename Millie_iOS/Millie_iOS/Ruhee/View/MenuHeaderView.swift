//
//  MenuHeaderView.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/18.
//

import Foundation
import SnapKit
import UIKit


class MenuHeaderView: UIView {
    
    //MARK: - Property
    
    let bookcaseBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "menuBookcase"), for: .normal)
        return btn
    }()
    
    let booknoteBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "menuBooknote"), for: .normal)
        return btn
    }()
    
    let numberBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "menuNumber"), for: .normal)
        return btn
    }()
    
    let writeBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "btnFat"), for: .normal)
        return btn
    }()
    
    let underlineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 36.0 / 255.0, alpha: 1.0)
        return view
    }()
    
    //MARK: - UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(bookcaseBtn)
        addSubview(booknoteBtn)
        addSubview(numberBtn)
        addSubview(underlineView)
        addSubview(writeBtn)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
