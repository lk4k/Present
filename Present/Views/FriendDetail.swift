//
//  FriendDetail.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 4/5/22.
//

import SwiftUI

struct FriendDetail: View {
    @EnvironmentObject var friendInfo : FriendInfo
    
    var body: some View {
    
        VStack{
            //need to pull friends infomations
            
            
            //displaying variables
            HStack{
            Text(friendInfo.name).font(Font.custom("Nunito-ExtraLight", size: 30))
                Button("friend") {
                    
                }.frame(width: 150, height: 70)
                .background(Color.Pink)
                .foregroundColor(Color.black)
                .cornerRadius(80.0)
                .font(Font.custom("Nunito-ExtraLight", size: 23))
                Button("favorite"){
                    
                }.frame(width: 150, height: 70)
                .background(Color.Pink)
                .foregroundColor(Color.black)
                .cornerRadius(80.0)
                .font(Font.custom("Nunito-ExtraLight", size: 20))
            }
            HStack{
                Text("wishlist:").font(Font.custom("Nunito-ExtraLight", size: 30))
            Text(friendInfo.wishlist).font(Font.custom("Nunito-ExtraLight", size: 23))
            }
        }
       
     
      
    }

    
}

struct FriendDetail_Previews: PreviewProvider {
    static var previews: some View {
       FriendDetail()
        
    }
}

