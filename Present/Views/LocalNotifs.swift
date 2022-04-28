//
//  LocalNotifs.swift
//  Present
//
//  Created by Claire Wang (student LM) on 4/27/22.
//

import Foundation
import SwiftUI

class NotificationManager {
    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) {
            (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(notificationHour : Int = 1, notificationDay : Int = 1, notificationMonth : Int = 1, notificationMinute : Int = 1, friendName : String = "") {
         let content = UNMutableNotificationContent()
        content.title = "Happy Birthday to \(friendName)"
        content.subtitle = "Check on your friend in the app"
        content.sound = .default
        content.badge = 1
        
        // time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // calendar
        var dateComponents = DateComponents()
        dateComponents.hour = notificationHour
        dateComponents.minute = notificationMinute
        dateComponents.month = notificationMonth
        dateComponents.day = notificationDay
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        // location
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}


struct LocalNotifs: View {
    var body: some View {
        VStack(spacing: 40) {
            
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotifs_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotifs()
    }
}
