//
//  NotificationsManager.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 18/11/21.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject {
    func sendNotification(title: String, body: String, doesRepeat: Bool, hour: Int, minute: Int, idS: String){
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.body = body
        
        var date = DateComponents()
        date.hour = hour
        date.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: doesRepeat)
        
        /*
        var delayTimeTrigger: UNTimeIntervalNotificationTrigger?
        if let delayInterval = delayInterval {
            delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval:  TimeInterval(delayInterval), repeats: false)
        }*/
        
        notificationContent.sound = UNNotificationSound.default
        UNUserNotificationCenter.current().delegate = self
        
        let request = UNNotificationRequest(identifier: idS, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription )
            }
        }
        
    }
}

extension NotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("notification will be presented")
        completionHandler([.badge, .sound, .alert])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let identifier = response.actionIdentifier
        switch identifier {
            case UNNotificationDismissActionIdentifier:
                print("notif was dismissed")
                completionHandler()
            case UNNotificationDefaultActionIdentifier:
                completionHandler()
            default:
                completionHandler()
        }
    }
    
}
