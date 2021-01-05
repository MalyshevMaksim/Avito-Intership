//
//  RemoteError.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation

enum RemoteError: Error {
    
    case badResponse
    case badStatusCode
    case badData
    case decodeError
    case badUrl
}
