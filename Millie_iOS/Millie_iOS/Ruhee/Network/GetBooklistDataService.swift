//
//  GetBooklistDataService.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/06/04.
//

import Foundation
import Alamofire

struct GetBooklistDataService {
    
    // 여러 뷰컨에서도 shared로 접근하면 같은 인스턴스에 접근 가능
    static let shared = GetBooklistDataService()
    
    // 탈출 클로저로 completion을 정의해서 함수 종료되도 상관없이
    // 해당 네트워크 작업이 끝날 때 completion 클로저에 네트워크의 결과를 담아서 호출
    func getBookInfo(completion : @escaping (NetworkResult<Any>) -> Void) {
        
        // 데이터 받아오려는 주소 정의
        let URL = APIConstants.booksURL
        let header : HTTPHeaders = ["Content-Type": "application/json"] // 필요한 헤더를 key - value 형태로 작성
        
        // URL을 가지고, GET 방식을 통해, JSONEncoding 방식으로, header 정보와 함꼐 Request를 보내기 위한 정보를 묶어서 dataRequest에 저장
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // dataRequest를 가지고 진짜 서버에서 보내서 통신 Request 진행
        // 통신이 완료되면 클로저를 통해서 dataResponse라는 이름으로 결과 도착
        dataRequest.responseData { (dataResponse) in
            
            switch dataResponse.result {
            case .success:
                
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
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
        
        guard let decodedData = try? decoder.decode(BookListDataModel<Book>.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData.data!.books)
                        
        
    }
    
}
