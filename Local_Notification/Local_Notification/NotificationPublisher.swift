//
//  NotificationPublisher.swift
//  Local_Notification
//
//  Created by Admin on 06/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit
class NotificationPublisher {
    
    func sendNotification(title:String,Subtitle:String,body:String,badge:Int?,delay:Int?){
        let content = UNMutableNotificationContent()
        content.title=title
        content.subtitle=Subtitle
        content.body=body
        
        
        var delayTimeTrigger:UNTimeIntervalNotificationTrigger?
        if let delay = delay{
            delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delay), repeats: false)
        }
        
        if let badge = badge {
            var badgeCount=UIApplication.shared.applicationIconBadgeNumber
            badgeCount += badge
        }
        
        content.sound = .default
        UNUserNotificationCenter.current().delegate=self as UNUserNotificationCenterDelegate
        
        let request =  UNNotificationRequest(identifier: "hello", content: content, trigger: delayTimeTrigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else{
                
            }
        }
   }
}

extension NotificationPublisher:UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
}
