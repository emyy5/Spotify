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
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
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
        guard let url = URL(string: Constants.tokenAPIURL) else {
            return
        }
        var components = URLComponents()
        components.queryItems = [
        URLQueryItem(name: "grant_type", value: "authorizaton_code"),
        URLQueryItem(name: "code", value: code),
        URLQueryItem(name: "redirect_uri", value: "https://www.iosacademy.io"),
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded ", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Faliure to get base64")
            completion(false)
            return
        }
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request){ data, _, error in
            
            guard let  data = data,
                  error == nil else {
                completion(false)
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("Success: \(json)")
            }
            catch {
                print(error.localizedDescription)
                completion(false)
            }
        }
        task.resume()
    }
    public func refreshAccessToken(){
        
    }
    public func cacheToken(){
        
    }
}
