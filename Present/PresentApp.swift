//
//  PresentApp.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 2/24/22.
//

import SwiftUI
import Firebase


class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Present: App {
    
    //Declare global state object
    @StateObject var userInfo = UserInfo()
    //firebase set up
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userInfo) //inject the variable
        }
    }
}
