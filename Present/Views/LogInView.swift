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
                
                    Text("Login")
                        .font(Font.custom("Nunito", size: 42))
                        .frame(width: 180, height: 180)
                        .background(Color.Pink)
                        .foregroundColor(Color.black)
                        .cornerRadius(200.0)
                        .padding()
               
                
                
                
                HStack {
                    Spacer()
                    Spacer()
                    Image(systemName: "mail").resizable()
                        .frame(width: 40, height: 25)
                    TextField("email", text: $userInfo.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .font(Font.custom("Nunito", size: 30))
                    
                    
                }
                .frame(width: 350, height: 80)
                .background(Color.Pink)
                .foregroundColor(Color.black)
                .cornerRadius(80.0)
                .padding()
                
                
                HStack {
                    Spacer()
                    Spacer(minLength: 15)
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    SecureField("password", text: $userInfo.password)
                        .font(Font.custom("Nunito", size: 30))
                    
                }
                .frame(width: 350, height: 80)
                .background(Color.Pink)
                .foregroundColor(Color.black)
                .cornerRadius(80.0)
                
                Button("Forgot Password") {
                    FirebaseFunctions.forgotPassword(email: userInfo.email){ success in
                    }}
                    .foregroundColor(Color.blue)
                    .font(Font.custom("Nunito", size: 20))
                
                Spacer()
                
                Button("Create Account") {
                    FirebaseFunctions.authenticate(email: userInfo.email, password: userInfo.password){ success in
                        if success{
                            userInfo.loggedIn = true
                        }
                    }
                }
                .frame(width: 350, height: 80)
                .background(Color.Pink)
                .foregroundColor(Color.black)
                .cornerRadius(80.0)
                .font(Font.custom("Nunito", size: 30))
                
                
                Button("Sign In") {
                    FirebaseFunctions.login(email: userInfo.email, password: userInfo.password){ success in
                        if success{
                            userInfo.loggedIn = true
                        }
                    }
                }
                .frame(width: 350, height: 80)
                .background(Color.Pink)
                .foregroundColor(Color.black)
                .cornerRadius(80.0)
                .font(Font.custom("Nunito", size: 30))
                .padding()
                
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
