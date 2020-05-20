//
//  ReportFeedViewController.swift
//  Coordinators
//
//  Created by Mojisola Adebiyi on 18/05/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

class ReportFeedViewController: UIViewController,Storyboarded {
    var feed:Feed?
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {print("Deinit :\(self)")}

    
    @IBAction func didPressYes(_ sender: Any) {
        coordinator?.deleteFeed(feed: feed!)
    }
    @IBAction func didPressNo(_ sender: Any) {
        coordinator?.reportNo()
    }
}
