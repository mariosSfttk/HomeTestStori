//
//  AppDelegate.swift
//  AppTestMovies
//
//  Created by JESSICA OLIVERA on 07/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: InitViewController() )
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

