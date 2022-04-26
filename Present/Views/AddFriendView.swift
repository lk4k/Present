//
//  AddFriendView.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 4/22/22.
//

import SwiftUI

struct AddFriendView: View {
    @EnvironmentObject var userInfo : UserInfo
    @State var email : String
    
    
    var body: some View {
        TextField("please type in your friend's email", text: $email).disableAutocorrection(true)
            .padding()
        Button("add my friend") {
            FirebaseFunctions.getFriendFromEmail(userInfo: userInfo, email: email, completion: {success in
                if success {
                    print(userInfo.dataAsDictionary())
                    print("friend found")
                    FirebaseFunctions.mergeUser(userInfo.dataAsDictionary(), completion: {_ in
                        
                    })
                }
                else {
                    print("friend not found")
                }
                
            })
//            FirebaseFunctions.mergeUser(userInfo.dataAsDictionary()) { _ in
//
//            }
        }
        
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView(email: "myemail@gmail.com")
    }
}
