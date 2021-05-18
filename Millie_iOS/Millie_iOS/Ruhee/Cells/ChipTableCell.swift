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
    
    let buttonImageArray = ["chipHighlight", "chipPost", "chipOnereview", "chipOudioreview"]
    
    var chipCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245.0 / 255.0, green: 244.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(chipCV)
        addSubview(lineView)
        
        chipCV.delegate = self
        chipCV.dataSource = self
        chipCV.register(ChipCollectionCell.self, forCellWithReuseIdentifier: "ChipCollectionCell")
        
        chipCV.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
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

extension ChipTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipCollectionCell", for: indexPath) as? ChipCollectionCell else { return UICollectionViewCell() }
        cell.chipBtn.setImage(UIImage(named: buttonImageArray[indexPath.row]), for: .normal)
        return cell
    }
    
    
}

extension ChipTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (106/375)
        
        return CGSize(width: cellWidth, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 25, bottom: 16, right: 0)
    }
}
