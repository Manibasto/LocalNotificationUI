//
//  viewNotificationController.swift
//  notification
//
//  Created by Anil Kumar on 27/06/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import UIKit

class viewNotificationController: UIViewController {

  
  public lazy var notificationTable : UITableView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UITableView())
  
  public lazy var backButton: UIButton = {
    $0.setTitle("Back", for: .normal)
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.setTitleColor(.black, for: .normal)
    $0.backgroundColor = UIColor(red:0.92, green:0.94, blue:0.95, alpha:1.0)
    $0.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
    return $0
  }(UIButton())
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      view.backgroundColor = .white
      view.addSubview(notificationTable)
      view.addSubview(backButton)
      
      notificationTable.showsVerticalScrollIndicator = false
      notificationTable.layoutAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: backButton.topAnchor, right: view.rightAnchor, centerX: view.centerXAnchor, centerY: view.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
      
      backButton.layoutAnchor(top: notificationTable.bottomAnchor, left: nil, bottom: view.bottomAnchor, right: nil, centerX: view.centerXAnchor, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 10, paddingRight: 0.0, width: 100, height: 50, enableInsets: true)
      
      notificationTable.register(notificationCell.self, forCellReuseIdentifier: "notificationCell")
      notificationTable.tableFooterView = UIView()
      notificationTable.dataSource = self
      notificationTable.delegate = self
    }
  
  @objc func dismissController(){
    dismiss(animated: true, completion: nil)
  }
}

extension viewNotificationController: UITableViewDataSource,UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if notificationValues.shared.NotificationInstance.count == 0 {
      tableView.setEmptyMessage("No Notification in IDPal")
      return 0
    }else{
      return notificationValues.shared.NotificationInstance.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as? notificationCell    
    cell?.notiificationTitle.text = notificationValues.shared.NotificationInstance[indexPath.row].title
    cell?.notificationDetail.text = notificationValues.shared.NotificationInstance[indexPath.row].Message
    
    let Convertion = notificationValues.shared.NotificationInstance[indexPath.row].date
    let currentDate = NotificationController.shared.timeAgoSinceDate(Convertion!, currentDate: Date(), numericDates: true)

    cell?.notificationDays.text = currentDate
    return cell!
    
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90
  }
  
}
