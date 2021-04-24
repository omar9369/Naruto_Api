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
    
    /// This will get the amount of objects in the array
    /// - Returns: returns the number of elements in the array
    func getRows() -> Int{
        return arr.count
    }
    
    /// This method will get the element in a specific index from NarutoInfo
    /// - Parameter index: Will pass in the specific index
    /// - Returns: The element from the specific index
    func getObject(index: Int) -> NarutoInfo{
        return arr[index]
    }
    
    func geterror()->Error?{
        return error
    }
}
