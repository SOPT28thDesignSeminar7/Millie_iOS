//
//  InaeBookCell.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/19.
//

import SnapKit
import UIKit

class InaeBookCell: UITableViewCell {
    static let identifier = "InaeBookCell"

    private lazy var bookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_book_1")

        return imageView
    }()

    private lazy var bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSansKR(type: .bold, size: 17)
        label.text = "넛지"

        return label
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSansKR(type: .regular, size: 12)
        label.text = "리처드 H.틸러"
        label.textColor = UIColor.fontLightGrayColor

        return label
    }()

    private lazy var highlightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSansKR(type: .regular, size: 11)
        label.text = "2개의 하이라이트"
        label.textColor = UIColor.fontHighlight

        let attributedString = NSMutableAttributedString(string: label.text!, attributes: [NSAttributedString.Key.font: UIFont.Lato(type: .bold, size: 11) ?? UIFont.systemFont(ofSize: 11)])
        attributedString.addAttributes([NSAttributedString.Key.font: UIFont.NotoSansKR(type: .regular, size: 11) ?? UIFont.systemFont(ofSize: 11)], range: (label.text! as NSString).range(of: "개의 하이라이트"))

        label.attributedText = attributedString
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSansKR(type: .regular, size: 14)
        label.text = "디폴트 옵션이 존재하지 않는다."
        label.textColor = UIColor.fontMainColor

        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Lato(type: .regular, size: 12)
        label.text = "2021.03.09"
        label.textColor = UIColor.fontLightGrayColor

        return label
    }()

    private lazy var shareButton: UIButton = {
        let btn = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))
        btn.setImage(UIImage(named: "propIcShare"), for: .normal)

        return btn
    }()

    private lazy var likeButton: UIButton = {
        let btn = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))
        btn.setImage(UIImage(named: "propIcLike"), for: .normal)

        return btn
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension InaeBookCell {
    func setConstraint() {
        contentView.addSubviews([bookImage, bookTitleLabel, authorLabel, highlightLabel, descriptionLabel, dateLabel, shareButton, likeButton])

        bookImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16.5)
            make.leading.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(93)
        }

        bookTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bookImage.snp.top)
            make.leading.equalTo(bookImage.snp.trailing).inset(-14)
        }

        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(bookTitleLabel.snp.bottom)
            make.leading.equalTo(bookImage.snp.trailing).inset(-14)
        }

        highlightLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).inset(-15)
            make.leading.equalTo(authorLabel.snp.leading)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(highlightLabel.snp.bottom).inset(-11)
            make.leading.equalTo(highlightLabel.snp.leading)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-7)
            make.leading.equalTo(descriptionLabel.snp.leading)
        }

        likeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(33)
            make.bottom.equalToSuperview().inset(31)
        }

        shareButton.snp.makeConstraints { make in
            make.trailing.equalTo(likeButton.snp.leading).inset(-9)
            make.bottom.equalTo(likeButton.snp.bottom)
        }
    }
}
