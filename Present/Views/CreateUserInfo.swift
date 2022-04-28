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
                        FirebaseFunctions
                            .createUser(userInfo, withEmail: userInfo.email, password: userInfo.password, completion: { error in
                                
                                if error == nil {
                                    FirebaseFunctions.addUserName(userInfo.name)
                                    FirebaseFunctions.addBirthday(userInfo.birthday)
                                    FirebaseFunctions.addWishlist(userInfo.wishlist)
                                    
                                    FirebaseFunctions.authenticate(email: userInfo.email, password: userInfo.password){ success in
                                        if success{
                                    
                                            userInfo.loggedIn = true
                                        }
                                    }
                                }
                                else{
                                    print(error?.localizedDescription)
                                    print("login failed")
                                }
                            })
                        FirebaseFunctions.mergeUser(userInfo.dataAsDictionary()) { _ in
                            
                        }
                    }.frame(width: 300, height: 70)
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
