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
    @IBOutlet weak var navigationBackButton: UIButton!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var highLightLabel: UILabel!
    @IBOutlet weak var bookimage: UIImageView!
    var hightlightArray : [BookListHighlight] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let number  = setRandomNumber()
        numberOfPersonLikedLabel.text = "이 책에 하이라이트한 회원 " + String(number) + "명"
        
        
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.separatorStyle = .none
    
        booknameLabel.font = UIFont.NotoSansKR(type: .bold, size: 18)
        numberOfPersonLikedLabel.font = UIFont.NotoSansKR(type: .medium, size: 14)
        numberLabel.font = UIFont.Lato(type: .bold, size: 19)
        highLightLabel.font = UIFont.NotoSansKR(type: .regular, size: 12)
        
    }
    
    @IBAction func likeButtonTapped(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    func setRandomNumber() -> Int {
        let number = Int.random(in: 1000...30000)
        return number
    }
    
    func connectServer(){
        GetHighlightDataService.shared.getHighlightInfo{ (response) in
            switch(response)
            {
            case .success(let hightlightData):
                if let data = hightlightData as? BookDetail {
                    self.booknameLabel.text = data.title
                    self.numberLabel.text = String(data.highlightCount)
                    self.hightlightArray = data.highlights
                    //self.bookimage.image = UIImage(: data.image)
                }
            case .requestErr(let message) :
                print("requestERR",message)
            case .pathErr :
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
    }
    }
}

extension MyLibraryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentTableViewCell" ,for: indexPath) as? commentTableViewCell else { return UITableViewCell() }
        
        cell.layer.cornerRadius = 8.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 8.0
        cell.layer.shadowOpacity = 0.15
        cell.layer.masksToBounds = false
        
        cell.dateLabel.text = hightlightArray[indexPath.row].highlightDate
        cell.commentLabel.text = hightlightArray[indexPath.row].highlightText
        
//        cell.layer.borderWidth = 1.0
//        cell.layer.borderColor = CGColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0)
//        cell.layer.cornerRadius = 8.0
//        cell.setShadow(radius: 8, offset: CGSize(width: 0, height: 0), opacity: 0.15, color: .black)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 137
    }
    
}
