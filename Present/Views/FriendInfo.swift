//
//  FriendView.swift
//  Present
//
//  Created by Ella Kesler (student LM) on 4/4/22.
//

import SwiftUI

class FriendInfo : ObservableObject, Identifiable{
    var name : String
    @Published var birthday : Date
    @Published var wishlist : String
    var id = UUID()
    var email : String
    //@Published var image: UIImage = UIImage(named: "user")!
    
    init(email: String = "", name : String = "", birthday: Date = Date(), wishlist : String = ""){
        self.name = name
        self.birthday = birthday
        self.wishlist = wishlist
        self.email = email
      
    }
    
    init(data: [String: Any]){
        if let name = data["name"] as? String{
            self.name = name
        }
        else {
            self.name = "name not found"
        }
        if let birthday = data["birthday"] as? Date{
            self.birthday = birthday
        }
        else{
            self.birthday = Date()
        }
        if let wishlist = data["wishlist"] as? String{
            self.wishlist = wishlist
        }
        else{
            self.wishlist = "wishlist not found"
        }
        if let email = data["email"] as? String{
            self.email = email
        }
        else{
            self.email = "email not found"
        }
    }
}
