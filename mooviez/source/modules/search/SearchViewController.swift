//
//  SearchViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Variables
    var presenter: SearchPresenterProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = R.color.backgroundColor()
        setView()
    }
    
    private func setView() {
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: R.font.montserratBold(size: 22) ?? UIFont.systemFont(ofSize: 22),
            NSAttributedString.Key.foregroundColor: R.color.smallTitleColor() ?? .white
        ]
        navigationItem.title = R.string.localizable.title_h_navigation_bar()
    }

}

// MARK: - Search View Protocol
extension SearchViewController: SearchViewProtocol {
    
}
