//
//  SettingsView.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 2/14/22.
//

import SwiftUI

struct CreateUserInfo: View {
    @EnvironmentObject var userInfo : UserInfo
    
    //@StateObject var userInfo: UserInfo = UserInfo()
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.background)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Spacer()
                
                //                Image(systemName: "person.crop.circle")
                //                    .resizable()
                //                    .foregroundColor(Color.Pink)
                //                    .frame(width: 200, height: 200)
                //                    .aspectRatio(contentMode: .fill)
                //                    .clipShape(Circle())
                
                Spacer()
                VStack {
                    
                    HStack{
                        Image(systemName: "person")
                        //name
                        TextField("name", text: $userInfo.name)
                            .disableAutocorrection(true)
                            .padding()
                    }
                    .foregroundColor(Color.black)
                    .font(Font.custom("Nunito-ExtraLight", size: 30))
                    .padding()
                    
                    //birthday
                    DatePicker("birthday", selection: $userInfo.birthday)
                        .datePickerStyle(CompactDatePickerStyle())
                        .foregroundColor(Color.black)
                        .font(Font.custom("Nunito-ExtraLight", size: 28))
                        .padding()
                    
                    
                    //add wishlish
                    TextField("Wishlist", text: $userInfo.wishlist)
                        .disableAutocorrection(false)
                        .font(Font.custom("Nunito-ExtraLight", size: 22))
                        .padding()
                    
                    Button("create account"){
                        FirebaseFunctions.authenticate(email: userInfo.email, password: userInfo.password){ success in
                            if success{
                                userInfo.loggedIn = true
                            }
                        }
                    }.frame(width: 150, height: 70)
                    .background(Color.Pink)
                    .foregroundColor(Color.black)
                    .cornerRadius(80.0)
                    .font(Font.custom("Nunito-ExtraLight", size: 30))
                    
                    
                }.foregroundColor(Color.black)
                .padding()
                
                Spacer()
                Spacer()
                Spacer()
                
            }
        }
    }
}

struct CreateUserInfo_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserInfo()
    }
}
