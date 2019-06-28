//
//  ViewController.swift
//  notification
//
//  Created by Anil Kumar on 27/06/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import UIKit


let receiveCount = receiveValue()

class ViewController: UIViewController {

  
  
  public lazy var BatchView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = hexStringToUIColor(hex: "#2196f3")
    return $0
  }(UIView())
  
  public lazy var BatchNumber: UILabel = {
    $0.text = "1"
    $0.textColor = .white
    $0.textAlignment = .center
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = hexStringToUIColor(hex: "#e91e63")
    return $0
  }(UILabel())
  
  public lazy var triggerNotification: UIButton = {
    $0.setTitle("Trigger", for: .normal)
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.setTitleColor(.black, for: .normal)
    $0.backgroundColor = UIColor(red:0.92, green:0.94, blue:0.95, alpha:1.0)
    $0.addTarget(self, action: #selector(triggeringNotification), for: .touchUpInside)
    return $0
  }(UIButton())
  
  var count = String()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(BatchView)
    view.addSubview(triggerNotification)
    view.addSubview(BatchNumber)
    
    BatchNumber.layoutAnchor(top: BatchView.topAnchor, left: nil, bottom: nil, right: BatchView.rightAnchor, centerX: nil, centerY: nil, paddingTop: -15, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: -15, width: 50, height: 50, enableInsets: true)
    BatchView.layoutAnchor(top: nil, left: nil, bottom: nil, right: nil, centerX: view.centerXAnchor, centerY: view.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 100, height: 100, enableInsets: true)
    
    triggerNotification.layoutAnchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, centerX: view.centerXAnchor, centerY: nil, paddingTop: 100, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 100, height: 50, enableInsets: true)
    
    BatchNumber.isHidden = true
    
    let tapGusture = UITapGestureRecognizer(target: self, action: #selector(showTableView))
    BatchView.isUserInteractionEnabled = true
    BatchView.addGestureRecognizer(tapGusture)
    
    NotificationController.shared.registerLocalNotification()
        
    NotificationCenter.default.addObserver(self, selector: #selector(countShow), name: .postName, object: nil)
  }
  
  @objc func countShow(){
    print(notificationValues.shared.NotificationInstance)
      if !notificationValues.shared.NotificationInstance.isEmpty {
        BatchNumber.isHidden = false
        BatchNumber.text = String(notificationValues.shared.NotificationInstance.count)
      }
  }
  
  var i = 0
  
  @objc func triggeringNotification(){
    if i != 6 {
      NotificationController.shared.scheduleNotification(notificatioTitle: Body.title[i], notificationMessage: Body.Message[i], identifier: Body.IdentifireValue[i])
      i = i + 1
    }else{
      alert(message: "No Notification available", title: "Notification")
    }
  }
  
  
  @objc func showTableView(){
    let pop = viewNotificationController()
    pop.view.superview?.layer.cornerRadius = 0
    pop.view.clipsToBounds = false
    pop.preferredContentSize = CGSize(width: view.frame.width - 10, height: view.frame.height - 10)
    pop.modalPresentationStyle = UIModalPresentationStyle.popover
    pop.popoverPresentationController?.delegate = self
    pop.popoverPresentationController?.sourceView = view
    pop.popoverPresentationController?.sourceRect = CGRect(x:view.bounds.midX, y: view.bounds.midY,width: 0,height: 0)
    pop.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
    self.present(pop, animated: true, completion: nil)
  }
  
  override func viewDidLayoutSubviews() {
    BatchView.layer.cornerRadius = 8
    BatchView.layer.masksToBounds = true
    BatchNumber.layer.cornerRadius = BatchNumber.frame.width / 2
    BatchNumber.layer.masksToBounds = true
  }
  
  func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
      return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
}

func delay(_ delay:Double, closure:@escaping ()->()) {
  DispatchQueue.main.asyncAfter(
    deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

extension ViewController:UIPopoverPresentationControllerDelegate {
  func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
  }
}



