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
    @Binding var friendShowSheet : Bool
    
    var body: some View {
        TextField("search by email", text: $email).disableAutocorrection(true)
            .autocapitalization(.none)
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
        friendShowSheet = false
//            FirebaseFunctions.mergeUser(userInfo.dataAsDictionary()) { _ in
//
//            }
        }
        
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView(email: "myemail@gmail.com", friendShowSheet: Binding.constant(true))
    }
}
