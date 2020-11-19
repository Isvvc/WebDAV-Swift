//
//  Account.swift
//  WebDAV-Swift
//
//  Created by Isaac Lyons on 10/29/20.
//

import Foundation

public protocol WebDAVAccount {
    var username: String? { get }
    var baseURL: String? { get }
}

internal struct UnwrappedAccount {
    var username: String
    var baseURL: URL
    
    init?(account: WebDAVAccount) {
        guard let username = account.username,
              let baseURLString = account.baseURL,
              let baseURL = URL(string: baseURLString) else { return nil }
        self.username = username
        self.baseURL = baseURL
    }
}

public struct SimpleAccount: WebDAVAccount {
    public var username: String?
    public var baseURL: String?
}
