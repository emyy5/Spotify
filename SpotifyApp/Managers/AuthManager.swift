//
//  AuthManager.swift
//  SpotifyApp
//
//  Created by Eman Khaled on 11/10/2023.
//

import Foundation
final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    var isSignedIn : Bool{
        return false
    }
    private var accessTolen: String? {
        return nil
    }
    private var refereshToken : String? {
        return nil
    }
    private var tokenExpirationDate: Date?{
        return nil
    }
    private var shouldRefreshToken: Bool {
        return false
    }
}
