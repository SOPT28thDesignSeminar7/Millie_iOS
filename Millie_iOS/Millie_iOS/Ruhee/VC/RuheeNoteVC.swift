//
//  RuheeNoteVC.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/05/15.
//

import UIKit
import SnapKit

class RuheeNoteVC: UIViewController {
    
    //MARK: - Property
    
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
        noteTableView.register(BooklistTableCell.self, forCellReuseIdentifier: "BooklistTableCell")

        configureUI()
        
    }
    
    
    //MARK: - UI 관련
    
    func configureUI() {
        
        view.addSubview(noteTableView)
        view.addSubview(statusView)

        
        noteTableView.separatorStyle  = .none
        noteTableView.backgroundColor = .white
        
        statusView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(66)
        }
        
        noteTableView.snp.makeConstraints { (make) in
            make.top.equalTo(statusView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
     
    }
}


extension RuheeNoteVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 43
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
                return 258
            }
        }
        
        return CGFloat()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

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
            return 2
        }
    }
    
    // 테이블 뷰에 들어가는 셀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableCell", for: indexPath) as? ProfileTableCell else { return UITableViewCell() }
            
            return profileCell
            
        default:
            if indexPath.row == 0 {
                guard let chipCell = tableView.dequeueReusableCell(withIdentifier: "ChipTableCell", for: indexPath) as? ChipTableCell else { return UITableViewCell() }
                
                return chipCell
                
            } else if indexPath.row == 1 {
                guard let booklistCell = tableView.dequeueReusableCell(withIdentifier: "BooklistTableCell", for: indexPath) as? BooklistTableCell else { return UITableViewCell() }
                
                
                return booklistCell
            }
         
            return UITableViewCell()
        }
    }
    
    // 테이블뷰 헤더 부분
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = UITableViewHeaderFooterView()
            return header
        default:
            let header = UITableViewHeaderFooterView()
            header.backgroundColor = .blue
            return header
        }
    }
    
   
}
