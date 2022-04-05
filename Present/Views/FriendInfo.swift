//
//  FriendView.swift
//  Present
//
//  Created by Ella Kesler (student LM) on 4/4/22.
//

import SwiftUI

class FriendInfo : ObservableObject{
    var name : String
    @Published var birthday : Date
    @Published var wishlist : String
    @Published var image: UIImage = UIImage(named: "user")!
    
    init(name : String = "", birthday: Date = Date(), wishlist : String = ""){
        self.name = name
        self.birthday = birthday
        self.wishlist = wishlist
      
    }
}
