//
//  ViewModel.swift
//  API_Naruto
//
//  Created by Omar Hisham on 4/23/21.
//

import Foundation

typealias CompletionHandler = (()->())?
class ViewModel {
    
    var arr: Naruto?
    var error: Error?
    
    func fetchData(completionHandler: CompletionHandler){
        APIHandler.shared.fetchData { (arr, error) in
            //self.arr = arr ?? nil
            self.error = error
            completionHandler?()
        }
    }
    
//    func getRows() -> Int{
//        return arr.count
//    }
    
   // func getObject(index: Int) -> Naruto{
//        return arr[index]
//    }
    
    func getStrings(naruto: Naruto) -> String{
        
        let request_hash = naruto.results
//        let title = naruto.title
//        let type = naruto.type
//        let rated = naruto.rated
//        let combined = "\(title), \(type), \(rated)"
        let combined = "\(request_hash)"
        return combined
    }
    
    func geterror()->Error?{
        return error
    }
}
