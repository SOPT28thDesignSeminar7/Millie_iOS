//
//  NetworkResult.swift
//  Millie_iOS
//
//  Created by 김루희 on 2021/05/31.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail

}
