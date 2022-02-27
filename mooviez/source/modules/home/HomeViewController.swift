//
//  HomeViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Variables
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }

}

// MARK: - Home View Protocol
extension HomeViewController: HomeViewProtocol {
    
}
