//
//  LogInView.swift
//  SlowmoGraham2
//
//  Created by Lauren Kelz (student LM) on 2/2/22.
//

import SwiftUI

struct LogInView: View {
    
    //@EnvironmentObject var userInfo : UserInfo
    @EnvironmentObject var userInfo : UserInfo
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.background)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack {
                    Image(systemName: "mail")
                    TextField("email", text: $userInfo.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }.padding()
                .padding(.top)
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("password", text: $userInfo.password)
                }.padding()
                
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
                .frame(width: UIScreen.main.bounds.width - 100)
                .padding()
                .background(Color.buttonBackground)
                .foregroundColor(Color.buttonText)
                .cornerRadius(30.0)
                
                Button("Sign In") {
                    FirebaseFunctions.login(email: userInfo.email, password: userInfo.password){ success in
                        if success{
                            userInfo.loggedIn = true
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 100)
                .padding()
                .background(Color.buttonBackground)
                .foregroundColor(Color.buttonText)
                .cornerRadius(30.0)
                Spacer()
            }
        }
    }
    
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
