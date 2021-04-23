//
//  ViewModel.swift
//  API_Naruto
//
//  Created by Omar Hisham on 4/23/21.
//

import Foundation

typealias CompletionHandler = (()->())?
class ViewModel {
    
    var arr: [NarutoInfo] = []
    var error: Error?
    
    func fetchData(completionHandler: CompletionHandler){
        APIHandler.shared.fetchData { (arr, error) in
            self.arr = arr
            self.error = error
            completionHandler?()
        }
    }
    
    func getRows() -> Int{
        return arr.count
    }
    
    func getObject(index: Int) -> NarutoInfo{
        return arr[index]
    }
    
    func getStrings(naruto: NarutoInfo) -> String{
        
        let title = naruto.title
        let type = naruto.type
        let image_URL = naruto.image_url
        let combined = "\(title),\(type),\(image_URL)"
        return combined
    }
    
    func geterror()->Error?{
        return error
    }
}
