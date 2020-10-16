//
//  TabBarController.swift
//  spacexnews
//
//  Created by Andrei Blaj on 1/22/20.
//

import UIKit

typealias Tabs = (
    today: UIViewController,
    games: UIViewController,
    apps: UIViewController,
    arcade: UIViewController,
    search: UIViewController
)

class TabBarController: UITabBarController {
    
    init(tabs: Tabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.today, tabs.games, tabs.apps, tabs.arcade, tabs.search]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
    
}
