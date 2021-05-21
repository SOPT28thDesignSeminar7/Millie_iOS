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

    @IBOutlet var navigationBar: UIView!
    @IBOutlet var navigationProfileImage: UIImageView!
    @IBOutlet var navigationTitleLabel: UILabel!
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
        setTableView()
    }
}

// MARK: - Custom Methods

extension InaeNoteVC {
    func setView() {
        /// navigation
        profileImage.image = UIImage(named: "img_profile")

        navigationProfileImage.image = UIImage(named: "imgProfile")
        navigationProfileImage.alpha = 0

        navigationTitleLabel.text = "김솝트의 서재"
        navigationTitleLabel.font = UIFont.NotoSansKR(type: .bold, size: 20)
        navigationTitleLabel.textColor = UIColor.fontEmphasis
        navigationTitleLabel.alpha = 0

        let attr = NSMutableAttributedString(string: navigationTitleLabel.text!, attributes: [NSAttributedString.Key.font: UIFont.NotoSansKR(type: .bold, size: 15) ?? UIFont.systemFont(ofSize: 15)])
        attr.addAttributes([NSAttributedString.Key.font: UIFont.NotoSansKR(type: .regular, size: 15) ?? UIFont.systemFont(ofSize: 15)], range: (navigationTitleLabel.text! as NSString).range(of: "의 서재"))
        navigationTitleLabel.attributedText = attr

        /// header

        bookCaseNameLabel.text = "김솝트의 서재"
        bookCaseNameLabel.font = UIFont.NotoSansKR(type: .bold, size: 20)
        bookCaseNameLabel.textColor = UIColor.fontEmphasis

        let bookAttr = NSMutableAttributedString(string: bookCaseNameLabel.text!, attributes: [NSAttributedString.Key.font: UIFont.NotoSansKR(type: .bold, size: 20) ?? UIFont.systemFont(ofSize: 20)])
        bookAttr.addAttributes([NSAttributedString.Key.font: UIFont.NotoSansKR(type: .regular, size: 20) ?? UIFont.systemFont(ofSize: 20)], range: (bookCaseNameLabel.text! as NSString).range(of: "의 서재"))

        bookCaseNameLabel.attributedText = bookAttr

        followerLabel.text = "팔로잉 0 • 팔로워 0"
        followerLabel.font = UIFont.NotoSansKR(type: .bold, size: 12)
        followerLabel.textColor = UIColor.fontMainColor
        let followerAttr = NSMutableAttributedString(string: followerLabel.text!)
        followerAttr.addAttributes([NSAttributedString.Key.font: UIFont.NotoSansKR(type: .regular, size: 12) ?? UIFont.systemFont(ofSize: 12)], range: (followerLabel.text! as NSString).range(of: "팔로잉"))
        followerAttr.addAttributes([NSAttributedString.Key.font: UIFont.NotoSansKR(type: .regular, size: 12) ?? UIFont.systemFont(ofSize: 12)], range: (followerLabel.text! as NSString).range(of: "팔로워"))
        followerLabel.attributedText = followerAttr

        goalImage.image = UIImage(named: "100Days")

        goalLabel.text = "43일째 8밀리"
        goalLabel.textColor = UIColor.fontMainColor

        let goalAttr = NSMutableAttributedString(string: goalLabel.text!, attributes: [NSAttributedString.Key.font: UIFont.NotoSansKR(type: .regular, size: 12) ?? UIFont.systemFont(ofSize: 12)])
        goalAttr.addAttributes([NSAttributedString.Key.font: UIFont.Lato(type: .bold, size: 12) ?? UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.lightPurple], range: (goalLabel.text! as NSString).range(of: "8"))
        goalLabel.attributedText = goalAttr
    }

    func setTableView() {
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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.7, delay: .nan, options: .curveEaseIn) {
                self.navigationBar.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.98)
            } completion: { _ in
                UIView.animate(withDuration: 0.8, delay: 0.6) {
                    self.navigationTitleLabel.alpha = 1
                    self.navigationProfileImage.alpha = 1
                }
            }

        } else {
            UIView.animate(withDuration: 0.7, delay: .nan, options: .curveEaseIn) {
                self.navigationBar.backgroundColor = .clear
                self.navigationTitleLabel.alpha = 0
                self.navigationProfileImage.alpha = 0
            }
        }
    }
}
