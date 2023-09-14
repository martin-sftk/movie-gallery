//
//  ViewController.swift
//  Movie Gallery
//
//  Created by Martín Serrano on 12/09/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let upcomingViewController = UINavigationController(rootViewController: UpcomingViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let downloadsViewController = UINavigationController(rootViewController: DownloadsViewController())
        //searchViewController, downloadsViewController
        setViewControllers([homeViewController, upcomingViewController], animated: true)
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        upcomingViewController.tabBarItem.image = UIImage(systemName: "star")
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadsViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        homeViewController.title = "Movies"
        upcomingViewController.title = "Favorites"
        searchViewController.title = "Top Searches"
        downloadsViewController.title = "Downloads"
        
        tabBar.tintColor = .label
    }


}

