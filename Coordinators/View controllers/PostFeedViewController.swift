//
//  PostFeedViewController.swift
//  Coordinators
//
//  Created by Mojisola Adebiyi on 16/05/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

class PostFeedViewController: UIViewController,Storyboarded {
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var feedTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {print("Deinitialized \(self)")}
    
    @IBAction func didPressPost(_ sender: Any) {
        coordinator?.post(feed:feedTextfield.text!)
    }
}
