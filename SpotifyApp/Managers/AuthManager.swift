//
//  AuthManager.swift
//  SpotifyApp
//
//  Created by Eman Khaled on 11/10/2023.
//

import Foundation
final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "e2661df1c0764416b4fc5969163edd80"
        static let clientSecret = "0c90f645004f4ba89d878ebe22033725"
    }
    var isSignedIn: Bool{
        return false
    }
    private init() {}
    var signedInURL : URL?{
       let scopes = "user-read-private"
        let redirectURI = "https://www.iosacademy.io"//.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    private var accessToken: String? {
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
    public func exchangeCodeForToken(code : String, completion: @escaping((Bool)->Void)
    
    ){
        //get Token
    }
    public func refreshAccessToken(){
        
    }
    public func cacheToken(){
        
    }
}
