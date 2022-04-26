//
//  FriendDetail.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 4/5/22.
//

import SwiftUI

struct FriendDetail: View {
    @EnvironmentObject var userInfo : UserInfo
    //var defaultFriend: FriendInfo = FriendInfo(name: "Jamie", birthday: Date(), wishlist: "bread")
    @State private var showSheet = false
    
    var body: some View {
        VStack{
            Text("Friends").font(Font.custom("Nunito-ExtraLight", size: 40))
                
            HStack{
                Spacer()
                
                Button("+"){
                    //add pull friend info function
                     showSheet = true
                }.frame(width: 70, height: 70)
                                .background(Color.Pink)
                                .foregroundColor(Color.black)
                                .cornerRadius(80.0)
                                .font(Font.custom("Nunito-ExtraLight", size: 20))
                
            }
            
            List(userInfo.friends){
                friend in
                VStack{
                    Text("name: \(friend.name)").font(Font.custom("Nunito-ExtraLight", size: 30))
                    Text("birthday: \(friend.birthday)").font(Font.custom("Nunito-ExtraLight", size: 30))
                
                    Text("wishlist: \(friend.wishlist)").font(Font.custom("Nunito-ExtraLight", size: 30))
                    
                }
                
            }
        
        }.sheet(isPresented: $showSheet, content: {
            AddFriendView(email: "please type in your friend's email")
        })
        
        
        
    }
    
    
}

struct FriendDetail_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetail()
        
    }
}

