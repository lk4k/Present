//
//  SettingsView.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 2/14/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userInfo : UserInfo
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.background)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
               
                Spacer()
                VStack {
                    //name
                    HStack{
                        Image(systemName: "person")
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
                        .font(Font.custom("Nunito-ExtraLight", size: 25))
                        .padding()
                    
                    
                    //add wishlish
                    TextField("wishlist", text: $userInfo.wishlist)
                        .disableAutocorrection(false)
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Nunito-ExtraLight", size: 25))
                        .frame(width: 300, height: 300, alignment: .top)
                        .background(Color.blue)
                        .cornerRadius(20.0)
                        
                        .padding()
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Button("update account") {
                        FirebaseFunctions.mergeUser(userInfo.dataAsDictionary(), completion: {_ in })                    }
                        .frame(width: 250, height: 70)
                        .background(Color.Pink)
                        .foregroundColor(Color.black)
                        .cornerRadius(80.0)
                        .font(Font.custom("Nunito-ExtraLight", size: 30))
                    
                    
                    
                }.foregroundColor(Color.black)
                .padding()
                
                
                
                
                
                Button("sign out") {
                    FirebaseFunctions.signOut(userInfo)
                }
                .frame(width: 200, height: 70)
                .background(Color.Pink)
                .foregroundColor(Color.black)
                .cornerRadius(80.0)
                .font(Font.custom("Nunito-ExtraLight", size: 30))
                
                Spacer()
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
