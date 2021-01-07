//
//  RemoteError.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation

enum RemoteError: Error {
    
    case badUrl(reason: String)
    case badData(reason: String)
    case badResponse(reason: String)
    case badStatusCode(reason: String)
    case badDecode(reason: String)
}
