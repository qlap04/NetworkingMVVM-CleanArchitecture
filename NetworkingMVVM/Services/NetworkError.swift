//
//  Error.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 16/08/2024.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed
    case unknown
    case encodingFailed
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "invalid URL"
        case .requestFailed:
            return "Failed Resquest"
        case .decodingFailed:
            return "Can't Decodable"
        case .unknown:
            return "Unknown error"
        case.encodingFailed:
            return "Failed Encoding"
        }
    }
}
