//
//  LogInView.swift
//  SlowmoGraham2
//
//  Created by Lauren Kelz (student LM) on 2/2/22.
//

import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var userInfo : UserInfo

    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.offWhite)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()

                Image("birthDaveImage")
                    .resizable()
                    .frame(width: 2*100, height: 2*114, alignment: .center)
                
                Text("present")
                    .font(Font.custom("Nunito-ExtraLight", size: 80))
                    .padding()
                
                
                
                
                HStack {
                    Spacer()
                    Spacer()
                    Image(systemName: "mail").resizable()
                        .frame(width: 40, height: 25)
                    Spacer()
                    Spacer()
                    
                    TextField("email", text: $userInfo.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .font(Font.custom("Nunito-ExtraLight", size: 30))
                    
                    
                }
                .frame(width: 350, height: 80)
                .foregroundColor(Color.black)
                .padding()
                
                
                HStack {
                    Spacer()
                    Spacer(minLength: 15)
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Spacer()
                    Spacer()
                    
                    SecureField("password", text: $userInfo.password)
                        .font(Font.custom("Nunito-ExtraLight", size: 30))
                    
                }
                .frame(width: 350, height: 80)
                .foregroundColor(Color.black)
                
                Button("forgot password") {
                    FirebaseFunctions.forgotPassword(email: userInfo.email){ success in
                    }}
                    .foregroundColor(Color.blue)
                    .font(Font.custom("Nunito-Light", size: 20))
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    Button("sign up") {
                        
                        showSheet = true
                    }
                    .frame(width: 150, height: 70)
                    .background(Color.Pink)
                    .foregroundColor(Color.black)
                    .cornerRadius(80.0)
                    .font(Font.custom("Nunito-ExtraLight", size: 30))
                    
                    
                    Button("sign in") {
                        FirebaseFunctions.login(email: userInfo.email, password: userInfo.password){ success in
                            if success{
                                
                                userInfo.loggedIn = true
                            }
                        }
                    }
                    .frame(width: 150, height: 70)
                    .background(Color.Pink)
                    .foregroundColor(Color.black)
                    .cornerRadius(80.0)
                    .font(Font.custom("Nunito-ExtraLight", size: 30))
                    .padding()
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
        }.sheet(isPresented: $showSheet, content: {
            CreateUserInfo()
        })
    }
    
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
