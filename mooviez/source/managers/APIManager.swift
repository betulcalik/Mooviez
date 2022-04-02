//
//  APIManager.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Alamofire

final class APIManager {
    
    // MARK: - Variables
    static let shared = APIManager()

    // MARK: - API Requests
    func getRequest<T: Decodable>(_ urlString: String, decodable: T.Type, parameters: Parameters?, completionHandler: @escaping (Result<T, Error>) -> Void) {
        let request = AF.request(urlString, method: .get, parameters: parameters)
        
        request.validate()
            .responseDecodable(of: decodable) { (response) in
                if let error = response.error {
                    completionHandler(.failure(error))
                } else {
                    if let responseData = response.value {
                        completionHandler(.success(responseData.self))
                    }
                }
            }
    }
    
}
