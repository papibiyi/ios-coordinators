//
//  FeedsViewController.swift
//  Coordinators
//
//  Created by Mojisola Adebiyi on 16/05/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

protocol FeedsViewControllerDelegate {
    func addFeed(feed:Feed)
    func deleteFeed(feed:Feed)
}

class FeedsViewController: UIViewController,Storyboarded,FeedsViewControllerDelegate {
    var feeds = [Feed]()
    weak var coordinator: MainCoordinator?
    private var emptyStateLabel =  UILabel()
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addFeedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tableView.register(UINib(nibName: "\(FeedTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(FeedTableViewCell.self)")
    }
    
    deinit {print("Deinit :\(self)")}

    
    
    @objc func didPressSettings() {
        coordinator?.settings()
    }
    
    @IBAction func didPressAddButton(_ sender: Any) {
        coordinator?.addFeed()
    }
    
    func addFeed(feed: Feed) {
        feeds.insert(feed, at: 0)
        tableView.reloadData()
    }
    
    func deleteFeed(feed: Feed) {
        feeds.removeAll { (temp) -> Bool in
            temp.id == feed.id
        }
        tableView.reloadData()
    }
    
    private func setupViews(){
        tableView.separatorStyle = .none
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didPressSettings))
        addFeedButton.layer.cornerRadius = 25
        emptyStateLabel.text = "No feeds at the moment"
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.center = tableView.center
    }
}

extension FeedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = feeds.isEmpty ? emptyStateLabel : nil
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FeedTableViewCell.self)", for: indexPath) as! FeedTableViewCell
        cell.label.text = feeds[indexPath.row].feed
        return cell
    }
}

extension FeedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.feedDetails(feed: feeds[indexPath.row])
    }
}
