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
    
    let remember = DeviceState(deviceTitle: .remember)
    let forget = DeviceState(deviceTitle: .forget)
    private(set) var deviceStates = [DeviceState]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailCell.self, forCellReuseIdentifier: DetailCell.reuseIdentifier)
        deviceStates = [remember, forget]
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
        cell.textLabel?.text = deviceState.deviceTitle.rawValue
        return cell
    }
}

extension DetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deviceState = deviceStates[indexPath.row]
        if deviceState === forget {
            deviceState.selected = true
            print("FORGET")
        } else {
            deviceState.selected = false
            print("REMEMBER")
        }
    }
}

