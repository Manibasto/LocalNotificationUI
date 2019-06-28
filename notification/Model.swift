//
//  Model.swift
//  notification
//
//  Created by Anil Kumar on 27/06/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import Foundation

struct receiveValue {
  var title           : String = ""
  var Message         : String = ""
  var IdentifireValue : String = ""
  var date            : Date? 
}

class notificationValues{
  
  private static var privateShared: notificationValues?
  
  static var shared: notificationValues {
    if privateShared == nil {
      privateShared = notificationValues()
    }
    return privateShared!
  }
  class func destroy() {
    privateShared = nil
  }
  
  var NotificationInstance : [receiveValue] = []
  
}


struct Body {
  static let title            = ["Steve Rogers", "Tony Stark", "RomanOff", "Elizabeth Olsen", "Bruce Banner", "Thor"]
  static let Message          = ["Steve Rogers is the First Avenger", "Tony Stark is a genius blessed", "RomanOff is one of the best fighter ", "Elizabeth Olsen is young", "Bruce Banner known as Hulk", "Thor - An Immortal Guy from"]
  static let IdentifireValue  = ["1", "2", "3", "4", "5", "6"]
}
