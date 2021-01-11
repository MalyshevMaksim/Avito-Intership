//
//  RemoteError.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//


enum RemoteError: Error {
    
    case badUrl
    case badData
    case badResponse
    case badStatusCode
    case badDecode
}
