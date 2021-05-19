//
//  InaeNoteVC.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/15.
//

import SnapKit
import UIKit

class InaeNoteVC: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var bookCaseNameLabel: UILabel!
    @IBOutlet var followerLabel: UILabel!
    @IBOutlet var goalImage: UIImageView!
    @IBOutlet var goalLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    // MARK: - UIComponents

    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white

        let bookmark = UIImageView(image: UIImage(named: "btnFat"))

        view.addSubviews([myBookCaseButton, readingNoteButton, statisticsButton, bookmark])
        myBookCaseButton.snp.makeConstraints { make in
            make.top.equalTo(18)
            make.leading.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().inset(6)
        }

        readingNoteButton.snp.makeConstraints { make in
            make.top.equalTo(18)
            make.leading.equalTo(myBookCaseButton.snp.trailing).inset(-27)
            make.bottom.equalToSuperview().inset(6)
        }

        statisticsButton.snp.makeConstraints { make in
            make.top.equalTo(18)
            make.leading.equalTo(readingNoteButton.snp.trailing).inset(-27)
            make.bottom.equalToSuperview().inset(6)
        }

        bookmark.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-2)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(42)
        }

        return view
    }()

    private lazy var myBookCaseButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("내책장", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.NotoSansKR(type: .regular, size: 15)

        return btn
    }()

    private lazy var readingNoteButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("독서노트", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.NotoSansKR(type: .bold, size: 15)
        btn.sizeToFit()

        /// button underline
        let underline = CALayer()
        underline.frame = CGRect(x: 0, y: btn.frame.height - 5, width: btn.frame.width, height: 2)
        underline.backgroundColor = UIColor.black.cgColor
        btn.layer.addSublayer(underline)

        return btn
    }()

    private lazy var statisticsButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("통계", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.NotoSansKR(type: .regular, size: 15)

        return btn
    }()

    // MARK: - Local variables

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
    }
}

// MARK: - Custom Methods

extension InaeNoteVC {
    func setView() {
        profileImage.image = UIImage(named: "img_profile")

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(InaeTagCell.self, forCellReuseIdentifier: InaeTagCell.identifier)
        tableView.register(InaeBookCell.self, forCellReuseIdentifier: InaeBookCell.identifier)
    }
}

// MARK: - UITableViewDataSource

extension InaeNoteVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InaeTagCell.identifier) as? InaeTagCell else { return UITableViewCell() }

            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InaeBookCell.identifier) as? InaeBookCell else { return UITableViewCell() }

            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension InaeNoteVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        48
    }
}
