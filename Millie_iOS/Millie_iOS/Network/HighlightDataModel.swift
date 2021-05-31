//
//  HighlightDataModel.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/31.
//

import Foundation

// MARK: - HighlightDataModel

struct HighlightDataModel <T : Codable> {
    let status : Int
    let message : String?
    let data : T
    
    enum CodingKeys : String, CodingKey {
        case status
        case message
        case data
    }
}

// MARK: - Highlight

struct Highlight : Codable {
    let highlightDate, highlightText  : String
    
    enum CodingKeys : String, CodingKey {
        case highlightDate, highlightText
    }
}
