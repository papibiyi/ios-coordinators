//
//  LoginViewController.swift
//  Coordinators
//
//  Created by Mojisola Adebiyi on 16/05/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,Storyboarded {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {print("Deinit :\(self)")}

    
    @IBAction func didPressLogin(_ sender: Any) {
        coordinator?.feeds()
    }
}
