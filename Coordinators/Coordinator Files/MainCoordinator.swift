//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Mojisola Adebiyi on 16/05/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators =  [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if UserDefaults.standard.object(forKey: "HasSignedUp") as? Bool ?? false {
            login()
        }else{
            signUp()
        }
    }
    
    func login(){
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func signUp(){
        let vc = SignUpViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func feeds(){
        let vc = FeedsViewController.instantiate()
        vc.coordinator = self
        vc.navigationItem.title = "Feeds"
        vc.navigationItem.setHidesBackButton(true, animated: false)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func feedDetails(feed: Feed){
        let vc = FeedDetailsViewController.instantiate()
        vc.feed = feed
        vc.coordinator = self
        vc.navigationItem.title = "Feed"
        navigationController.pushViewController(vc, animated: true)
    }
    
    func addFeed(){
        let vc = PostFeedViewController.instantiate()
        vc.coordinator = self
        vc.navigationItem.title = "Add feed"
        navigationController.pushViewController(vc, animated: true)
    }
    
    func deleteFeed(feed:Feed){
        navigationController.viewControllers.forEach { (viewController) in
            let tempVC = viewController as? FeedsViewController
            tempVC?.deleteFeed(feed: feed)
        }
        navigationController.dismiss(animated: false) {
            self.navigationController.popViewController(animated: false)
        }
    }
    
    func post(feed:String) {
        navigationController.popViewController(animated: true)
        let feedsVC = navigationController.visibleViewController as? FeedsViewController
        feedsVC?.addFeed(feed: Feed(feed: feed))
    }
    
    func settings(){
        let vc = SettingsViewController.instantiate()
        vc.coordinator = self
        vc.navigationItem.title = "Settings"
        navigationController.pushViewController(vc, animated: true)
    }
    
    func report(feed: Feed){
        let vc = ReportFeedViewController.instantiate()
        vc.coordinator = self
        vc.feed = feed
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func reportNo(){
        navigationController.dismiss(animated: true)
    }
    
    func logout(){
        let vc = SignUpViewController.instantiate()
        vc.coordinator = self
        navigationController.viewControllers.removeAll()
        login()
    }
}
