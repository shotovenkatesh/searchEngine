//
//  GoogleManager.swift
//  searchEngine
//
//  Created by Venkatesh on 11/12/2020.
//

import Foundation
import SwiftyJSON
struct GoogleManager {
    let googleURL = "https://www.googleapis.com/customsearch/v1?key=AIzaSyD_VPg2CO4k04b-EABlCnTGKD0nawm9A88&cx=7df9dd7388e987500"
    
    func getGoogleData(keyword:String){
        let urlString = "\(googleURL)&q=\(keyword)"
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
                        let url1 = json["items"][0]["displayLink"]
                        let url2 = json["items"][1]["displayLink"]
                        let url3 = json["items"][2]["displayLink"]
                        let url4 = json["items"][3]["displayLink"]
                        let url5 = json["items"][4]["displayLink"]
                        let url6 = json["items"][5]["displayLink"]
                        let url7 = json["items"][6]["displayLink"]
                        let url8 = json["items"][7]["displayLink"]
                        let url9 = json["items"][8]["displayLink"]
                        let url10 = json["items"][9]["displayLink"]
                        print(url1)
                        print(url2)
                        print(url3)
                        print(url4)
                        print(url5)
                        print(url6)
                        print(url7)
                        print(url8)
                        print(url9)
                        print(url10)
                    }catch{
                        print("Error fetching Data")
                    }
                    
                }
                  
            }
            task.resume()
        
        }
        
    }
}
