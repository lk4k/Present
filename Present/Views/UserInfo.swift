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
    var uid = UUID()
    
    
    init(name : String = "", email : String = "", password : String = "", loggedIn : Bool = false, birthday: Date = Date(), wishlist : String = ""){
        
        FirebaseFunctions.signOut()
        self.loggedIn = false
        
        self.name = name
        self.email = email
        self.loggedIn = loggedIn
        self.password = password
        self.birthday = birthday
        self.wishlist = wishlist
        
        FirebaseFunctions.getUserInfo(self)
    }
}

