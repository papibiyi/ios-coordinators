//
//  FeedDetailsViewController.swift
//  Coordinators
//
//  Created by Mojisola Adebiyi on 16/05/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

class FeedDetailsViewController: UIViewController,Storyboarded {
    var feed: Feed?
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet private weak var feedDetails: UILabel!
    @IBOutlet private weak var feedDateLabel: UILabel!
    
    deinit {print("Deinit :\(self)")}

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        feedImage.layer.cornerRadius = 25
        feedDetails.text = feed?.feed
    }
    
    @IBAction func didPressReportFeed(_ sender: Any) {
        coordinator?.report(feed: feed!)
    }
}
