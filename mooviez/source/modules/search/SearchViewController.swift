//
//  SearchViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - UI Components
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        return search
    }()
    
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
        setSearchController()
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: R.font.montserratBold(size: 22) ?? UIFont.systemFont(ofSize: 22),
            NSAttributedString.Key.foregroundColor: R.color.smallTitleColor() ?? .white
        ]
        navigationItem.title = R.string.localizable.title_h_navigation_bar()
    }
    
    private func setSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = .search
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}

// MARK: - Search View Protocol
extension SearchViewController: SearchViewProtocol {
    
}

// MARK: - Search Results Updating
extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
    }
    
}
