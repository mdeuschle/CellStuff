//
//  DetailCell.swift
//  CellStuff
//
//  Created by Matt Deuschle on 11/22/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    static let reuseIdentifier = "detailCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with deviceState: String) {
        textLabel?.text = deviceState
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
}

//class DeviceState {
//    let deviceTitle: DeviceTitle
//    var selected = false
//    init(deviceTitle: DeviceTitle) {
//        self.deviceTitle = deviceTitle
//    }
//}
//
//enum DeviceTitle: String {
//    case remember = "Remember"
//    case forget = "Forget"
//}

