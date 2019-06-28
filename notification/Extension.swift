//
//  Extension.swift
//  notification
//
//  Created by Anil Kumar on 27/06/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  func layoutAnchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, centerX : NSLayoutXAxisAnchor?, centerY : NSLayoutYAxisAnchor? ,paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
    var topInset = CGFloat(0.0)
    var bottomInset = CGFloat(0.0)
    
    if #available(iOS 11, *), enableInsets {
      let insets = self.safeAreaInsets
      topInset = insets.top
      bottomInset = insets.bottom
      
    }
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
    }
    if let left = left {
      self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
    }
    if let centerX = centerX{
      centerXAnchor.constraint(equalTo: centerX, constant: 0.0).isActive = true
    }
    if let centerY = centerY{
      centerYAnchor.constraint(equalTo: centerY, constant: 0.0).isActive = true
    }
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
  }
}


extension Notification.Name {
  static let postName = Notification.Name("NotificationValues")
}

extension UIViewController {
  
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
  
}




extension UITableView {
  
  enum scrollsTo {
    case top,bottom
  }
  
  func setEmptyMessage(_ message: String) {
    let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
    messageLabel.text = message
    messageLabel.textColor = UIColor(red: 0.17, green: 0.51, blue: 0.75, alpha: 1)
    messageLabel.numberOfLines = 0;
    messageLabel.alpha = 0.52
    messageLabel.textAlignment = .center;
    messageLabel.font = UIFont(name: "Montserrat-Medium", size: 29)
    messageLabel.sizeToFit()
    
    self.backgroundView = messageLabel;
    self.separatorStyle = .none;
  }
  
  func restore() {
    self.backgroundView = nil
    self.separatorStyle = .singleLine
  }
  
  public func reloadData(_ completion: @escaping ()->()) {
    UIView.animate(withDuration: 0, animations: {
      self.reloadData()
    }, completion:{ _ in
      completion()
    })
  }
  
  func scroll(to: scrollsTo, animated: Bool) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
      let numberOfSections = self.numberOfSections
      let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
      switch to{
      case .top:
        if numberOfRows > 0 {
          let indexPath = IndexPath(row: 0, section: 0)
          self.scrollToRow(at: indexPath, at: .top, animated: animated)
        }
        break
      case .bottom:
        if numberOfRows > 0 {
          let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
          self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
        }
        break
      }
    }
  }
}
