//
//  AppDelegate.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // MARK: Tab Bar Method
//        let submodules = (
//            today: TodayView(),
//            games: GamesView(),
//            apps: AppsView(),
//            arcade: ArcadeView(),
//            search: SearchView()
//        )
//
//        let tabBarController = TabBarModuleBuilder.build(usingSubmodules: submodules)
//        window?.rootViewController = tabBarController
        
        // MARK: Single View Method
        let todayView = TodayView()
        window?.rootViewController = todayView
        
        window?.makeKeyAndVisible()
        return true
    }

}

