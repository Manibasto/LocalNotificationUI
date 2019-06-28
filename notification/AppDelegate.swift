//
//  AppDelegate.swift
//  notification
//
//  Created by Anil Kumar on 27/06/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import UIKit
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    UIApplication.shared.applicationIconBadgeNumber = 0
    
    NotificationController.shared.registerLocalNotification()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let controller = ViewController()
    controller.view.backgroundColor = .white
    window?.rootViewController = UINavigationController(rootViewController: controller)
    window?.makeKeyAndVisible()
    
    return true
  }
}

extension AppDelegate: UNUserNotificationCenterDelegate{
  
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    NotificationCenter.default.post(name: .postName, object: nil)
    completionHandler([.alert, .sound])
    
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    
    if response.notification.request.identifier == "Expense Alert" {
      print("Handling notifications with the Local Notification Expense Alert")
    }else{
      print("Handling notifications with the Local Notification Budget Alert")
    }
    
    completionHandler()
  }
  
//  func notificationTapping(){
//    guard let rootViewControllers = self.window?.rootViewController else {
//      return
//    }
//    if let viewControllers = getCurrentViewController(rootViewControllers) {
//      viewControllers.popOrPushToViewController("NotificationsScreen")
//    }
//  }
//
//
//
//  func getNotficatioScreen(){
//
//    let mainViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//    let leftViewController = storyBoard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
//    let slideMenuController = ExSlideMenuController(mainViewController: mainViewController, leftMenuViewController: leftViewController)
//    slideMenuController.automaticallyAdjustsScrollViewInsets = true
//    slideMenuController.navigationController?.navigationBar.isHidden = true
//    slideMenuController.delegate = mainViewController as? SlideMenuControllerDelegate
//    self.window?.rootViewController = UINavigationController(rootViewController: slideMenuController)
//    self.window?.makeKeyAndVisible()
//  }
}


