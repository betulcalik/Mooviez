//
//  HomeDetailViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 26.03.2022.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    // MARK: - Variables
    var presenter: HomeDetailPresenterProtocol?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = R.color.backgroundColor()
    }
 
}

// MARK: - Home Detail View Protocol
extension HomeDetailViewController: HomeDetailViewProtocol {
    
}
