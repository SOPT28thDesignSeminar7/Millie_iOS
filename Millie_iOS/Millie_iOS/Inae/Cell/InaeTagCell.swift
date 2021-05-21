//
//  InaeTagCell.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/18.
//

import SnapKit
import UIKit

class InaeTagCell: UITableViewCell {
    static let identifier = "InaeTagCell"

    // MARK: - UIComponents

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false

        return scroll
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 13
        stack.axis = .horizontal

        stack.addArrangedSubview(UIImageView(image: UIImage(named: "chipHighlight")))
        stack.addArrangedSubview(UIImageView(image: UIImage(named: "chipPost")))
        stack.addArrangedSubview(UIImageView(image: UIImage(named: "chipOnereview")))
        stack.addArrangedSubview(UIImageView(image: UIImage(named: "chipOudioreview")))

        return stack
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

    private func setConstraint() {
        contentView.addSubviews([scrollView])
        scrollView.addSubview(stackView)

        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16.5)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
        }

        stackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
