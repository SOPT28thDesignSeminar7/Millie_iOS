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
        
        tabBar.tintColor = .tabbarTabbarYellow

        let inaeStroyboard = UIStoryboard(name: "InaeNote", bundle: nil)
        let yeonseoStoryboard = UIStoryboard(name: "MyLibrary", bundle: nil)

        guard let home = inaeStroyboard.instantiateViewController(identifier: "InaeNoteVC") as? InaeNoteVC,
              let myBook = yeonseoStoryboard.instantiateViewController(identifier: "MyLibraryViewController") as? MyLibraryViewController else { return }

        let feed = UINavigationController(rootViewController: RuheeNoteVC())
        feed.isNavigationBarHidden = true
        
        home.tabBarItem.image = UIImage(named: "icHomeInactive")
        feed.tabBarItem.image = UIImage(named: "icFeedInactive")
        myBook.tabBarItem.image = UIImage(named: "icStudyroomInactive")
        
        home.tabBarItem.selectedImage = UIImage(named: "icHomeActive")
        feed.tabBarItem.selectedImage = UIImage(named: "icFeedActive")
        myBook.tabBarItem.selectedImage = UIImage(named: "icStudyroomActive")
        
        home.tabBarItem.title = "홈"
        feed.tabBarItem.title = "피드"
        myBook.tabBarItem.title = "내서재"
        
        self.viewControllers = [home, feed, myBook]
        
        self.selectedIndex = 1
    }
}
