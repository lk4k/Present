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
    @State private var wantNotifications = false
    
    var body: some View {
        VStack{
            Text("check in on your friends!").font(Font.custom("Nunito-ExtraLight", size: 22.6))
            
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
                    
                    Toggle("Notifications", isOn: $wantNotifications)
                    if wantNotifications{
                        Button("Request permission"){
                            NotificationManager.instance.requestAuthorization()
                        }
                        /*
                         Button("Schedule notification"){
                         NotificationManager.instance.scheduleNotification(notificationHour : 9, notificationDay : friend.birthday.get(Calendar.Component.day), notificationMonth : friend.birthday.get(Calendar.Component.month), notificationMinute : 1)
                         }
                         */
                        Button("Schedule Notification"){
                            NotificationManager.instance.scheduleNotification(notificationHour : 12, notificationDay : 27, notificationMonth : 04, notificationMinute : 57, friendName : friend.name)
                    }
                }
                
            }.background(Color.init(red: 249/255, green: 229/255, blue: 218/255))
            
        }
        
    }.sheet(isPresented: $showSheet, content: {
        AddFriendView(email: "")
    })
    
}


}

struct FriendDetail_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetail()
        
    }
}

