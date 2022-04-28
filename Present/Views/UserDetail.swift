//
//  BirthdayBuddyView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//
// Account Detail is the infromation shown on a persons account by themselves, people who view their account, and their followers. Non-followers see a persons username. For followers it is basic level infromation such as name, birthday, and username.

import SwiftUI

struct UserDetail: View {
    @EnvironmentObject var userInfo : UserInfo
    
    var body: some View {
        
            //displaying variables
            Text("name: \(userInfo.name)").font(Font.custom("Nunito-ExtraLight", size: 30))
            
                Text("birthday: ").font(Font.custom("Nunito-ExtraLight", size: 30))
                Text(userInfo.birthday, style: .date).font(Font.custom("Nunito-ExtraLight", size: 30))
            

                Text("wishlist: \(userInfo.wishlist)").font(Font.custom("Nunito-ExtraLight", size: 30))
            
            
        }
       
     
    }

    


struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
       UserDetail()
        
    }
}
