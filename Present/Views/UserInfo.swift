//
//  UserInfo.swift
//  SlowmoGraham2
//
//  Created by Lauren Kelz (student LM) on 2/2/22.
//

import SwiftUI

class UserInfo : ObservableObject, Identifiable{
    var name : String
    var email : String
    var password : String
    @Published var birthday : Date
    @Published var wishlist : String
    @Published var image: UIImage = UIImage(named: "user")!
    @Published var loggedIn : Bool
    @Published var friends : [FriendInfo] = [FriendInfo]()
    var uid = UUID()
    
    
    
    init(name : String = "", email : String = "", password : String = "", loggedIn : Bool = false, birthday: Date = Date(), wishlist : String = "", friends : [FriendInfo] = [FriendInfo]()){
        
        //FirebaseFunctions.signOut()
        //self.loggedIn = false
        
        self.name = name
        self.email = email
        self.loggedIn = loggedIn
        self.password = password
        self.birthday = birthday
        self.wishlist = wishlist
        self.friends = friends
        
        FirebaseFunctions.getUserInfo(self)
    }
    
    // used for Firestore database.

        func dataAsDictionary() -> [String: Any]{
            var friends : [String: Any] = [String: Any]()
            
            for friend in self.friends{
                friends[friend.id.uuidString] = friend.dataAsDictionary()
            }

            let data : [String: Any] = [

                "name": name,

                "email": email,

                "wishlist": wishlist,

                "birthday": birthday,

                "password": password,
                
                "friends" : friends

            ]

            return data

        }
    
}



