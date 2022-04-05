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
            UserDetail()
                .tabItem {
                    Label("My Info", systemImage: "person")}
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
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
