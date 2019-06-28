//
//  notificationCell.swift
//  notification
//
//  Created by Anil Kumar on 27/06/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import UIKit


class notificationCell: UITableViewCell {
  
  let notificationIcon : UIImageView = {
    $0.image = UIImage(named: "iPhone")
    return $0
  }(UIImageView())
  
  let notiificationTitle : UILabel = {
    $0.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
    $0.textColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1)
    return $0
  }(UILabel())
  
  let notificationDetail : UILabel = {
    $0.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
    $0.numberOfLines = 0
    $0.textAlignment = .left
    $0.textColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)
    return $0
  }(UILabel())
  
  let notificationDays : UILabel = {
    $0.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
    $0.textAlignment = .right
    $0.textColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1)
    return $0
  }(UILabel())
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubview(notificationIcon)
    addSubview(notiificationTitle)
    addSubview(notificationDetail)
    addSubview(notificationDays)
    
    bringSubviewToFront(notificationIcon)
    bringSubviewToFront(notiificationTitle)
    bringSubviewToFront(notificationDetail)
    bringSubviewToFront(notificationDays)
    
    notificationIcon.layoutAnchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0.0, paddingLeft: 14, paddingBottom: 0.0, paddingRight: 0.0, width: 50.0, height: 50.0, enableInsets: true)
    
    notiificationTitle.layoutAnchor(top: topAnchor, left: notificationIcon.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 16.0, paddingLeft: 28.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
    
    notificationDetail.layoutAnchor(top: notiificationTitle.bottomAnchor, left: notificationIcon.rightAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 5.0, paddingLeft: 28.0, paddingBottom: 0.0, paddingRight: 5.0, width: 0.0, height: 0.0, enableInsets: true)
    
    notificationDays.layoutAnchor(top: topAnchor, left: notiificationTitle.rightAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 20.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 10, width: 0.0, height: 14.0, enableInsets: true)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

