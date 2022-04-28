//
//  HomeView.swift
//  SlowmoGraham2
//
//  Created by Lauren Kelz (student LM) on 2/5/22.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        TabView{
            FriendDetail()
               .tabItem { Label("my friends", systemImage: "person.3")}
            UserDetail()
                .tabItem {
                    Label("my info", systemImage: "person")}
            SettingsView()
                .tabItem {
                    Label("settings", systemImage: "gear")
                }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
