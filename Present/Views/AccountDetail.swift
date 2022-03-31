//
//  BirthdayBuddyView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//
// Account Detail is the infromation shown on a persons account by themselves, people who view their account, and their followers. Non-followers see a persons username. For followers it is basic level infromation such as name, birthday, and username.

import SwiftUI
import struct Kingfisher.KFImage

struct AccountDetail: View {
    @EnvironmentObject var userInfo : UserInfo
    
    var body: some View {
        
        let fetchData : FetchData = FetchData(userInfo: userInfo)
        
        //list of responses from parsed JSON information given the user's birthday
        VStack{
            List(fetchData.responses.births) {
                birth in
                HStack{
                    VStack{
                        //Displays the name of the notable person
                        Text("Name: \(birth.text ?? "")")
                        
                        //Displays the age of the notable person
                        Text("Age: \(2022 - (birth.year ?? 2022))")
                    }
                    
                    //List displays a photo of the notable person
//                    KFImage(URL(string: birth.pages[0]?.thumbnail?.source ?? "") ?? URL(string :"https://cdn.mos.cms.futurecdn.net/PuXipAW3AXUzUJ4uYyxPKC-1200-80.jpg"))
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 100, height: 50, alignment: .center)
//                        .cornerRadius(10.0)
                }
                .cornerRadius(5.0)
                
            }.foregroundColor(Color.offWhite)
            
            //displaying variables
            HStack{
            Text(userInfo.name).font(Font.custom("Nunito-ExtraLight", size: 30))
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
            Text(userInfo.wishlist).font(Font.custom("Nunito-ExtraLight", size: 23))
            }
        }
       
     
      
    }

    
}

struct AccountDetail_Previews: PreviewProvider {
    static var previews: some View {
       AccountDetail()
        
    }
}
