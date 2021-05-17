//
//  InaeNoteVC.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/15.
//

import SnapKit
import UIKit

enum Menu: String {
    case myBookCase = "내책장"
    case readingNote = "독서노트"
    case statistics = "통계"
}

class InaeNoteVC: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var bookCaseNameLabel: UILabel!
    @IBOutlet var followerLabel: UILabel!
    @IBOutlet var goalView: UIView!
    @IBOutlet var goalLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!

    // MARK: - Local variables

    let menuItems = [Menu.myBookCase, Menu.readingNote, Menu.statistics]

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
    }
}
