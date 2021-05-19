//
//  MyLibraryViewController.swift
//  Millie_iOS
//
//  Created by DYS on 2021/05/18.
//

import UIKit

class MyLibraryViewController: UIViewController {

    @IBOutlet weak var booknameLabel: UILabel!
    @IBOutlet weak var numberOfPersonLikedLabel: UILabel!
    @IBOutlet weak var likedButton: UIButton!
    @IBOutlet weak var commentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        booknameLabel.font = UIFont.NotoSansKR(type: .bold, size: 18)
        numberOfPersonLikedLabel.font = UIFont.NotoSansKR(type: .medium, size: 14)
        
    }
    
}

extension MyLibraryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentTableViewCell" ,for: indexPath) as? commentTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
