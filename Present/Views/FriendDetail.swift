//
//  FriendDetail.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 4/5/22.
//

import SwiftUI

struct FriendDetail: View {
    //@EnvironmentObject var friendInfo : FriendInfo
    
    var friendInfo: FriendInfo = FriendInfo(name: "Jamie", birthday: Date(), wishlist: "bread")
    
    var body: some View {
        
        //need to pull friends infomations
        
        VStack{
            
            
            Image(systemName: "person.crop.circle")
                .resizable()
                .foregroundColor(Color.green)
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            //displaying variables
            HStack{
                
                Text(friendInfo.name)
                    .font(Font.custom("Nunito-ExtraLight", size: 30))
                
                //add buttons for liking and
                
                
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

