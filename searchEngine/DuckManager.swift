//
//  DuckManager.swift
//  searchEngine
//
//  Created by Venkatesh on 11/12/2020.
//

import Foundation
import SwiftyJSON

struct DuckManager {
    let duckURL = "https://api.duckduckgo.com/?format=json&pretty=1"
    
    func getDuckData(keyword:String){
        let urlString = "\(duckURL)&q=\(keyword)"
        performRequest(urlString:urlString)
    }
    //MARK: -Networking
    func performRequest(urlString:String){
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }else{
                    do{
                        let json = try JSON(data: data!)
                        let url1 = json["RelatedTopics"][0]["FirstURL"]
                        let url2 = json["RelatedTopics"][1]["FirstURL"]
                        let url3 = json["RelatedTopics"][2]["FirstURL"]
                        let url4 = json["RelatedTopics"][3]["FirstURL"]
                        let url5 = json["RelatedTopics"][3]["Topics"][0]["FirstURL"]
                        let url6 = json["RelatedTopics"][4]["Topics"][0]["FirstURL"]
                        let url7 = json["RelatedTopics"][5]["Topics"][0]["FirstURL"]
                        let url8 = json["RelatedTopics"][6]["Topics"][0]["FirstURL"]
//                        let url9 = json["RelatedTopics"][7]["Topics"][0]["FirstURL"]
                        print(url1)
                        print(url2)
                        print(url3)
                        print(url4)
                        print(url5)
                        print(url6)
                        print(url7)
                        print(url8)
                    }catch{
                        print("Error fetching Data")
                    }
                    
                }
                  
            }
            task.resume()
        
        }
        
    }
}

