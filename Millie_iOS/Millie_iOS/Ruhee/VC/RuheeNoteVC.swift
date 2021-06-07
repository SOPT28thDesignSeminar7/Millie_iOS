//
//  RuheeNoteVC.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/15.
//

import UIKit

import Kingfisher
import SnapKit

class RuheeNoteVC: UIViewController {
    
    //MARK: - Property
    
    var bookListArray : [BookDetail] = []
    
    let noteTableView = UITableView()
    
    let statusView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTableView.delegate = self
        noteTableView.dataSource = self
        
        noteTableView.register(ProfileTableCell.self, forCellReuseIdentifier: "ProfileTableCell")
        noteTableView.register(ChipTableCell.self, forCellReuseIdentifier: "ChipTableCell")
        noteTableView.register(BooklistmenuTableCell.self, forCellReuseIdentifier: "BooklistmenuTableCell")
        noteTableView.register(BooklistTableCell.self, forCellReuseIdentifier: "BooklistTableCell")

        
        configureUI()
        getData()

    }
    
    
    //MARK: - UI 관련
    
    func configureUI() {
        
        view.addSubview(noteTableView)
        view.addSubview(statusView)

        noteTableView.separatorStyle  = .none
        noteTableView.backgroundColor = .white
//        noteTableView.isUserInteractionEnabled = true
        
        statusView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(66)
        }
        
        noteTableView.snp.makeConstraints { (make) in
            make.top.equalTo(statusView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
     
    }
    
    
    //MARK: - getData
    
    func getData() {

        GetBooklistDataService.shared.getBookInfo { (response) in
            switch(response) {
            
            case .success(let bookData):
                                
                if let decodedData = bookData as? [BookDetail] {
                    
                    print("여긴가?",decodedData)
                    

                    self.bookListArray = decodedData
                    self.noteTableView.reloadData()
                    
                    print("이게 리스트",self.bookListArray)
                    
                                
                }
                
            case .requestErr(let bookData):
                print("requestERR", bookData)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
}

//MARK: - UITableViewDelegate

extension RuheeNoteVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 44
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 282
        default:
            if indexPath.row == 0 {
                return 62.5
                
            } else if indexPath.row == 1 {
                return 35
                
            } else {
                return 258
            }
        }
        
    }
    
    // 셀 선택 시 화면 전환 및 데이터 전달
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0: break
            
        default:
            if indexPath.row == 0 {
                break
                
            } else if indexPath.row == 1 {
                break
                
            } else {
                let storyboard = UIStoryboard(name: "MyLibrary", bundle: nil)
                guard let nextVC = storyboard.instantiateViewController(identifier: "MyLibraryViewController")
                        as? MyLibraryViewController else { return }
                
                nextVC.bookID = bookListArray[indexPath.row-2].id
                
                self.navigationController?.pushViewController(nextVC, animated: true)
                
            }
        }
    }
    
    
    
}


//MARK: - UITableViewDataSource

extension RuheeNoteVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 테이블 뷰 섹션으로 나누기 : header 기준으로 나눔
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        
        case 0:
            return 1
            
        default:
            // headerview 기준으로 나눠서 아래에 5개가 들어가는 이유는..
            // 책이 6권 들어갈 경우... -> 기존 chipcell + booklistmenucell +6권(booklistcell)
            return bookListArray.count + 2
        }
    }
    
    // 테이블 뷰에 들어가는 셀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableCell", for: indexPath) as? ProfileTableCell else { return UITableViewCell() }
            profileCell.selectionStyle = .none
            
            return profileCell
            
        default:
            if indexPath.row == 0 {
                guard let chipCell = tableView.dequeueReusableCell(withIdentifier: "ChipTableCell", for: indexPath) as? ChipTableCell else { return UITableViewCell() }
                chipCell.selectionStyle = .none
                // 그래서 여기서 cell 클래스 인스턴스 완성된 다음
                // 호출을 시켜서 위에 그려질수잇도록 한...방법임
                chipCell.setCollectionUI()
                
                return chipCell
                
            } else if indexPath.row == 1 {
                guard let booklistmenuCell = tableView.dequeueReusableCell(withIdentifier: "BooklistmenuTableCell", for: indexPath) as? BooklistmenuTableCell else { return UITableViewCell()
                }
                booklistmenuCell.selectionStyle = .none
                
                return booklistmenuCell
                
            } else {
                guard let booklistCell = tableView.dequeueReusableCell(withIdentifier: "BooklistTableCell", for: indexPath) as? BooklistTableCell else { return UITableViewCell() }
                booklistCell.selectionStyle = .none
                
//                 indexPath.row - 2를 해주는 이유 : 책이 들어가야 하는 곳은 bookListArray[2]부터니까.. 전체가 8면 2를 빼줌... 그래야 셀이 6개...
                booklistCell.setData(bookTitle: bookListArray[indexPath.row-2].title,
                                     bookAuthor: bookListArray[indexPath.row-2].author,
                                     bookHighlightCount: bookListArray[indexPath.row-2].highlightCount,
                                     bookHighlight: bookListArray[indexPath.row-2].highlights.first!.highlightText,
                                     bookDate: bookListArray[indexPath.row-2].highlights.first!.highlightDate,
                                     bookCoverImage: bookListArray[indexPath.row-2].image)
                
                return booklistCell
            }
            
        }
    }
    
    // 테이블뷰 헤더 부분
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = UITableViewHeaderFooterView()
            return header
        default:
            let header = MenuHeaderView()
            header.layer.shadowOffset = CGSize(width: 0, height: -8)
            header.layer.shadowRadius = 6
            header.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.26)
            header.layer.shadowOpacity = 0.5
            return header
        }
    }
    
   
}
