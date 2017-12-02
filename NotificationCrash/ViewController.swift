//
//  ViewController.swift
//  NotificationCrash
//
//  Created by Kyosuke Takayama on 2017/12/02.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { granted, error in
            guard error == nil else { return }

            DispatchQueue.main.async {
                UIApplication.shared.cancelAllLocalNotifications()

                let calendar = Calendar(identifier: .gregorian)
                let timeZone = TimeZone.autoupdatingCurrent

                guard let date = DateComponents(calendar: calendar, timeZone: timeZone, year: 2017, month: 12, day: 1).date
                    else { return }

                let notify = UILocalNotification()
                notify.alertBody = "alert";
                notify.alertAction = "view"
                notify.repeatInterval = .month
                notify.fireDate = date

                UIApplication.shared.scheduleLocalNotification(notify)
                print(#line, ": ", notify)
            }
        }
    }

}


