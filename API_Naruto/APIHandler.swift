//
//  APIHandler.swift
//  API_Naruto
//
//  Created by Omar Hisham on 4/23/21.
//

import Foundation


typealias APICompletionHandler = ((Naruto?, Error?) -> ())?
class APIHandler{
    static let shared = APIHandler.init()
    
    private init(){}
    
    func fetchData(completionHandle: APICompletionHandler){
        guard let url = URL.init(string: "https://api.jikan.moe/v3/search/anime?q=naruto") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil{
                let jd = JSONDecoder.init()
                
                let arr = try? jd.decode( Naruto.self, from: data!)
                print(arr)
                completionHandle?(arr, nil)
            }else{
                completionHandle?(nil,error)
            }
        }.resume()
    }
}
