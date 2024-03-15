//
//  MajorService.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 06/03/2024.
//

import Foundation

public class MajorService {
    public static var requestDomain = ""


    static func getMajor(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let urlString = requestDomain //thực ra cái này ko cần thiết lắm, add https:// nếu cần
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

