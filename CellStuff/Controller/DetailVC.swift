//
//  DetailVC.swift
//  CellStuff
//
//  Created by Matt Deuschle on 11/22/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var button: UIButton!
    
//    let remember = DeviceState(deviceTitle: .remember)
//    let forget = DeviceState(deviceTitle: .forget)
    fileprivate var deviceStates = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailCell.self, forCellReuseIdentifier: DetailCell.reuseIdentifier)
        deviceStates = [DeviceState.remember, DeviceState.forget]
        button.isEnabled = false
        button.alpha = 0.1
    }
}

extension DetailVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceStates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.reuseIdentifier, for: indexPath) as? DetailCell else { fatalError() }
        let deviceState = deviceStates[indexPath.row]
        cell.configure(with: deviceState)
        return cell
    }
}

extension DetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        button.isEnabled = true
        button.alpha = 1
        let deviceState = deviceStates[indexPath.row]
        if deviceState == DeviceState.forget {
            print("FORGET")
        } else {
            print("REMEMBER")
        }
    }
}

private enum DeviceState {
    static let remember = "Remember"
    static let forget = "Forget"
}

