//
//  ViewController.swift
//  CellStuff
//
//  Created by Matt Deuschle on 11/22/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cgRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
        let button = UIButton(frame: cgRect)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        let dvc = DetailVC(nibName: "DetailVC", bundle: nil)
        navigationController?.pushViewController(dvc, animated: true)
    }
}

