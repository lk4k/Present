//
//  DataParsing.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/5/22.
//

import Foundation
import SwiftUI

class FetchData : ObservableObject{
    
    @Published var responses = Response()
    
    //The getData() initializer was replaced func parseData() so that the object automatically loads data with the user's selected information
    //Name: parseData
    //Description: This function parses the data given by our JSON formatted API url.
    //Parameters: month - month of user birthday, day - day of user birthday
    //Return: Gives parsed data
    init(userInfo : UserInfo){
        
        print("instantiating Fetchdata")
        let jsonURLString = "https://api.wikimedia.org/feed/v1/wikipedia/en/onthisday/births/\(String(userInfo.birthday.get(.month)))/\(String(userInfo.birthday.get(.day)))"
        print(jsonURLString)
        
        guard let url = URL(string: jsonURLString)
        else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, erros) in
            //gets data and convert to string
            guard let data = data
            else {
                print("Getting data from URL failed")
                return
            }
            
            guard let dataAsString = String(data: data, encoding: .utf8) else {return}
            print(dataAsString)
            
            print("data constructed")
            
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.responses = response
                }
            } else{
                print("JSON decoding failed")
            }
            
            
        }.resume()
        
    }
    
    
}

//The following structs all pull data from the decoded JSON inforamtion that we wanted to use
struct Response: Codable{
    var births : [Birth] = [Birth]()
    
}

struct Birth : Codable{
    var text : String?
    var pages : [Page?] = [Page]()
    var year : Int?
}

struct Page : Codable {
    var pageid: Int?
    var thumbnail : Thumbnail? = Thumbnail()
}

struct Thumbnail : Codable{
    var source : String?
}

// An extension added to the birth struct so that we can use an array of births to dynamically create List.
extension Birth: Identifiable{
    var id: String {return text!}
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
