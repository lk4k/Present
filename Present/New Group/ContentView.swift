//
//  ContentView.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 2/24/22.
//

import SwiftUI

struct ContentView: View {
    
    //@EnvironmentObject var userInfo : UserInfo
    @StateObject var userInfo : UserInfo
    
    var body: some View {
        Group{
            if userInfo.loggedIn{
                HomeView()
            } else {
                LogInView()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
