//
//  LogInView.swift
//  SlowmoGraham2
//
//  Created by Lauren Kelz (student LM) on 2/2/22.
//

import SwiftUI

struct LogInView: View {
    
    //@EnvironmentObject var userInfo : UserInfo
    @StateObject var userInfo = UserInfo()
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.offWhite)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    Spacer()
                    Image(systemName: "mail").resizable()
                        .frame(width: 40, height: 25)
                    TextField("email", text: $userInfo.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                }
                .frame(width: 350, height: 60)
                .background(Color.Blue)
                .foregroundColor(Color.black)
                .cornerRadius(30.0)
                .padding()
                
                HStack {
                    Spacer()
                    Spacer(minLength: 15)
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 25, height: 25)
                    SecureField("password", text: $userInfo.password)
                }
                .frame(width: 350, height: 60)
                .background(Color.Blue)
                .foregroundColor(Color.black)
                .cornerRadius(30.0)
                .padding()
                
                Button("Forgot Password") {
                    FirebaseFunctions.forgotPassword(email: userInfo.email){ success in
                    }}.foregroundColor(Color.background)
                .padding()
                
                Spacer()
                
                Button("Create Account with Email") {
                    FirebaseFunctions.authenticate(email: userInfo.email, password: userInfo.password){ success in
                        if success{
                            userInfo.loggedIn = true
                        }
                    }
                }
                .frame(width: 350, height: 60)
                .background(Color.Blue)
                .foregroundColor(Color.black)
                .cornerRadius(30.0)
                .padding()
                
                Button("Sign In") {
                    FirebaseFunctions.login(email: userInfo.email, password: userInfo.password){ success in
                        if success{
                            userInfo.loggedIn = true
                        }
                    }
                }
                .frame(width: 350, height: 60)
                .background(Color.Blue)
                .foregroundColor(Color.black)
                .cornerRadius(30.0)
                .padding()
                
                
            }
        }
    }
    
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
