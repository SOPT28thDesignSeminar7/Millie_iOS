//
//  APIConstants.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/31.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL

    static let baseURL = "http://3.36.64.41:5000"

    // MARK: - Feature URL

    static let booksURL = baseURL + "/api/books"
    static let highlightsURL = baseURL + "/api/highlights"
}
