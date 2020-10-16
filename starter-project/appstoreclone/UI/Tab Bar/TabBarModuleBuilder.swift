//
//  TabBarModuleBuilder.swift
//  spacexnews
//
//  Created by Andrei Blaj on 1/22/20.
//

import UIKit

class TabBarModuleBuilder {
    static func build(usingSubmodules submodules: TabBarRouter.Submodules) -> UITabBarController {
        let tabs = TabBarRouter.tabs(usingSubmodules: submodules)
        let tabBarController = TabBarController(tabs: tabs)
        tabBarController.tabBar.tintColor = UIColor.systemBlue
        return tabBarController
    }
}
