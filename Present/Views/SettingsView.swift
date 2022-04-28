//
//  SettingsView.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 2/14/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userInfo : UserInfo
    @State private var showSheet = false
    
    
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
//
                
                Image(systemName: "person")
                Spacer()
                VStack {
                    //change image
//                    Button("change picture") {
//                        self.showSheet.toggle()
//                    }
//                    .frame(width: 250, height: 70)
//                    .background(Color.Pink)
//                    .foregroundColor(Color.black)
//                    .cornerRadius(80.0)
//                    .font(Font.custom("Nunito-ExtraLight", size: 30))
//
                    
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
                        .font(Font.custom("Nunito-ExtraLight", size: 28))
                        .padding()
                
                    
                    //add wishlish
                    TextField("Wishlist", text: $userInfo.wishlist)
                        .disableAutocorrection(false)
                        .font(Font.custom("Nunito-ExtraLight", size: 22))
                        .padding()
                        
                    Button("update account") {
                        FirebaseFunctions.mergeUser(userInfo.dataAsDictionary(), completion: {_ in })                    }
                    .frame(width: 250, height: 70)
                    .background(Color.Pink)
                    .foregroundColor(Color.black)
                    .cornerRadius(80.0)
                    .font(Font.custom("Nunito-ExtraLight", size: 30))
                    

                    
                }.foregroundColor(Color.black)
                .padding()

                Spacer()
                Spacer()
                Spacer()
                
                
                
                Button("Sign Out") {
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
        .sheet(isPresented: $showSheet, onDismiss: {//closure that calls firebase function and passes image
            FirebaseFunctions.uploadPicture(userInfo.image){ result in
                FirebaseFunctions.addUserName(userInfo.name)
            }
        }, content: {
            ImagePicker(selectedImage: $userInfo.image)
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
