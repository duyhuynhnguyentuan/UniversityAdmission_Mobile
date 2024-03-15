//
//  University.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 27/02/2024.
//

import Foundation
import SwiftUI


public class UniversityService {
    public static var requestDomain = ""


    static func getUniversity(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let urlString = requestDomain // Assuming you're using HTTP, adjust as needed
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.noData))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidURL))
                return
            }

            guard (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(.decodingError))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            completion(.success(data))
        }

        task.resume()
    }
}
