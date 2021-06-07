//
//  GetHighlightDataService.swift
//  Millie_iOS
//
//  Created by DYS on 2021/06/01.
//

import Foundation
import Alamofire

struct GetHighlightDataService {
    static let shared = GetHighlightDataService()
    let bookID = 0
    
    func getHighlightInfo(completion: @escaping (NetworkResult<Any>) -> Void)
    {
//        let URL = APIConstants.baseURL + APIConstants.highlightsURL + String(bookID)
        let URL = "http://3.36.64.41:5000/api/highlights/60aef9aa1469fa2eefd0a4c0"
        let header : HTTPHeaders = ["Content-type" : "application/json"]
        
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            
            
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure: completion(.pathErr)
                
            }
        }
        
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
            case 200: return isValidData(data: data)
            case 400: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
        }
    }
    
    
    
    private func isValidData(data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(HighlightDataModel<BookDetail>.self, from: data)
        else { return .pathErr}
        // 우선 PersonDataModel 형태로 decode(해독)을 한번 거칩니다. 실패하면 pathErr
        
        // 해독에 성공하면 Person data를 success에 넣어줍니다.
        return .success(decodedData.data)
    }
    
    
    
}
