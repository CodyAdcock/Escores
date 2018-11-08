//
//  EscoreTabBarController.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class EscoreTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let homeNav = UIStoryboard(name: "Home", bundle: .main).instantiateInitialViewController(),
            let searchNav = UIStoryboard(name: "Search", bundle: .main).instantiateInitialViewController(),
//            let statsNav = UIStoryboard(name: "Stats", bundle: .main).instantiateInitialViewController(),
            let discoverNav = UIStoryboard(name: "Discover", bundle: .main).instantiateInitialViewController()else {return}
        
        homeNav.tabBarItem = UITabBarItem(title: "Live  ", image: #imageLiteral(resourceName: "video72"), tag: 0)
        discoverNav.tabBarItem = UITabBarItem(title: "Discover", image: #imageLiteral(resourceName: "world72"), tag: 1)
        searchNav.tabBarItem = UITabBarItem(title: "News", image: #imageLiteral(resourceName: "details72"), tag: 2)
//        statsNav.tabBarItem = UITabBarItem(title: "Stats", image: #imageLiteral(resourceName: "details72"), tag: 3)
        
        self.viewControllers = [ homeNav,discoverNav, searchNav]
        
        //custom colors
        tabBar.barTintColor = .black
        tabBar.tintColor = #colorLiteral(red: 0.2373240292, green: 0.6771883368, blue: 0.7988225222, alpha: 1)
        tabBar.unselectedItemTintColor = .white
    }
}
