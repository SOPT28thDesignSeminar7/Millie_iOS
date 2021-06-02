//
//  BookListDataModel.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/31.
//

import Foundation

// MARK: - BookListDataModel

struct BookListDataModel <T : Codable> : Codable {
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

// MARK: - Book

struct Book : Codable {
    let books : [BookDetail]
    
    enum CodingKeys : String, CodingKey {
        case books
    }
}

// MARK: - BookDetail

struct BookDetail : Codable {
    let id, title, author : String
    let highlightCount : Int
    let highlights : [BookListHighlight]
    let image : String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, author, highlightCount, highlights, image
    }
}

// MARK: - BookListHighlight

struct BookListHighlight: Codable {
    let highlightText, highlightDate: String
    
    enum CodingKeys : String, CodingKey {
        case highlightText, highlightDate
    }
}
