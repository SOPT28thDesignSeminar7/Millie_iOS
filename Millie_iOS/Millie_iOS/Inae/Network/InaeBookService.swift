//
//  InaeBookService.swift
//  Millie_iOS
//
//  Created by inae Lee on 2021/06/02.
//

import Alamofire
import Foundation

class InaeBookService {
    static let shared = InaeBookService()

    func getBooksData(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.booksURL
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        let decoder = JSONDecoder()

        let dataRequest = AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)

        dataRequest.responseData { response in

            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                if (200 ... 300).contains(statusCode) {
                    guard let data = response.value else { return }
                    guard let decodedData = try? decoder.decode(BookListDataModel<Book>.self, from: data) else { return completion(.pathErr) }

                    completion(.success(decodedData))
                }
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
