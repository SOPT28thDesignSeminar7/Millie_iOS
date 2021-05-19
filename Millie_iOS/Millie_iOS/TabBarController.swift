//
//  TabBarController.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/20.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let inaeStroyboard = UIStoryboard(name: "InaeNote", bundle: nil)
        let yeonseoStoryboard = UIStoryboard(name: "MyLibrary", bundle: nil)

        guard let home = inaeStroyboard.instantiateViewController(identifier: "InaeNoteVC") as? InaeNoteVC,
              let myBook = yeonseoStoryboard.instantiateViewController(identifier: "MyLibraryViewController") as? MyLibraryViewController else { return }

        let feed = RuheeNoteVC()

        self.viewControllers = [home, feed, myBook]
    }
}
