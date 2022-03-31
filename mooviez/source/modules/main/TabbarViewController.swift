//
//  TabbarViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import UIKit

class TabbarViewController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupViewControllers()
        setupTabbar()
        setupTabbarIcons()
    }

    private func setupViewControllers() {
        guard let home = HomeRouter.build() as? HomeViewController else { return }
        let homeVC = UINavigationController(rootViewController: home)
        
        guard let search = SearchRouter.build() as? SearchViewController else { return }
        let searchVC = UINavigationController(rootViewController: search)
        
        setViewControllers([ homeVC, searchVC ], animated: true)
    }
    
    private func setupTabbar() {
        tabBar.backgroundColor = R.color.backgroundColor()
        tabBar.tintColor = R.color.purpleColor()
        tabBar.unselectedItemTintColor = R.color.titleColor()
    }
    
    private func setupTabbarIcons() {
        guard let items = tabBar.items else { return }
        let titles = [ R.string.localizable.title_home(),
                       R.string.localizable.title_search() ]
        let images = ["house.fill", "magnifyingglass"]
        
        for i in 0..<images.count {
            items[i].image = UIImage(systemName: images[i])
            items[i].title = titles[i]
        }
    }

}
