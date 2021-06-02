//
//  HighlightDataModel.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/31.
//

import Foundation

// MARK: - HighlightDataModel

struct HighlightDataModel <T : Codable>: Codable {
    let status : Int
    let message : String?
    let data : T?
    
    enum CodingKeys : String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}

// MARK: - Highlight

struct Highlight : Codable {
    let highlightDate, highlightText  : String
    
    enum CodingKeys : String, CodingKey {
        case highlightDate, highlightText
    }
}
