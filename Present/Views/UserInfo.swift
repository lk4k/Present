//
//  UserInfo.swift
//  SlowmoGraham2
//
//  Created by Lauren Kelz (student LM) on 2/2/22.
//

import SwiftUI

class UserInfo : ObservableObject{
    var name : String
    var email : String
    var password : String
    @Published var image: UIImage = UIImage(named: "user")!
    @Published var loggedIn : Bool
    
    init(name : String = "", email : String = "", password : String = "", loggedIn : Bool = false){
        self.name = name
        self.email = email
        self.loggedIn = loggedIn
        self.password = password
        
        FirebaseFunctions.getUserInfo(self)
    }
}
