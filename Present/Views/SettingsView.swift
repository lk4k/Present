//
//  SettingsView.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 2/14/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userInfo : UserInfo
    //@StateObject var userInfo : UserInfo = UserInfo()
    @State private var showSheet = false
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.background)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(uiImage: userInfo.image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                
                Spacer()
                VStack {
                    //change image
                    Button("Change Picture") {
                        self.showSheet.toggle()
                    }
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .padding()
                    .background(Color.buttonBackground)
                    .foregroundColor(Color.buttonText)
                    .cornerRadius(30.0)
                    
                    Spacer()

                    
                    //name
                    HStack{
                    Image(systemName: "person")
                    TextField("name", text: $userInfo.name)
                        .disableAutocorrection(true)
                    }
                    
                    Spacer()
                    
                    //birthday
                    DatePicker("Enter your birthday", selection: $userInfo.birthday)
                        .datePickerStyle(CompactDatePickerStyle())
                        .frame(maxHeight: 200)
                    
                    Spacer()
                    
                    //add wishlish
                    TextField("Wishlist", text: $userInfo.wishlist)
                        .disableAutocorrection(false)
                    
                }.foregroundColor(Color.buttonText)
                .padding()
                .padding(.top)
                
        
    
                
                Button("Sign Out") {
                    FirebaseFunctions.signOut(userInfo)
                }
                .frame(width: UIScreen.main.bounds.width - 100)
                .padding()
                .background(Color.buttonBackground)
                .foregroundColor(Color.buttonText)
                .cornerRadius(30.0)
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
