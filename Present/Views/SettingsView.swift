//
//  SettingsView.swift
//  SlowmoGraham2
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
                //add name
                HStack {
                    Image(systemName: "person")
                    TextField("name", text: $userInfo.name)
                        .disableAutocorrection(true)
                }.foregroundColor(Color.buttonText)
                .padding()
                .padding(.top)
                Spacer()
                //add birthday
                HStack {
                    Image(systemName: "present")
                    DatePicker("Enter your birthday", selection: $userInfo.birthday)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 400)
                        .background(Color.init(red: 194/255, green: 219/255, blue: 223/255))
                }.foregroundColor(Color.buttonText)
                .padding()
                .padding(.top)
                
                
                
                Spacer()
                
                Button("Change Picture") {
                    self.showSheet.toggle()
                }
                .frame(width: UIScreen.main.bounds.width - 100)
                .padding()
                .background(Color.buttonBackground)
                .foregroundColor(Color.buttonText)
                .cornerRadius(30.0)
                
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
