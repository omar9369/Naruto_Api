//
//  APIHandler.swift
//  API_Naruto
//
//  Created by Omar Hisham on 4/23/21.
//

import Foundation


typealias APICompletionHandler = (([NarutoInfo], Error?) -> ())?
class APIHandler{
    static let shared = APIHandler.init()
    
    private init(){}
    
    
    /// This will fetch the data from the API and decode it so that swift code will understand the JSON file
    /// - Parameter completionHandle: We use a completion handler so that the information we get from from the api will be sent to the viewModel
    func fetchData(completionHandle: APICompletionHandler){
        guard let url = URL.init(string: "https://api.jikan.moe/v3/search/anime?q=naruto") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil{
                let jd = JSONDecoder.init()
                
                let arr = try! jd.decode( Naruto.self, from: data!)
                //print(arr.results)
                completionHandle?(arr.results, nil)
            }else{
                completionHandle?([],error)
            }
        }.resume()
    }
}
