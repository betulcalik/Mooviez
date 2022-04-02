//
//  SearchViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - UI Components
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.color = .lightGray
        return spinner
    }()
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.delegate = self
        search.searchBar.tintColor = R.color.purpleColor()
        search.searchBar.enablesReturnKeyAutomatically = false
        search.searchBar.returnKeyType = .done
        search.searchBar.placeholder = R.string.localizable.text_searchbar_placeholder()
        return search
    }()
    
    private lazy var movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = R.color.backgroundColor()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Variables
    var presenter: SearchPresenterProtocol?
    private var movies: [Movie] = []
    private var filteredMovies: [Movie] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        presenter?.load()
        view.backgroundColor = R.color.backgroundColor()
        setView()
        addTableView()
        addSpinner()
    }
    
    private func setView() {
        spinner.startAnimating()
        setNavigationBar()
        setSearchController()
        setTableView()
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
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setTableView() {
        movieTableView.register(SearchMovieTableViewCell.self,
                                forCellReuseIdentifier: SearchMovieTableViewCell.identifier)
    }
    
    private func addTableView() {
        view.addSubview(movieTableView)
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addSpinner() {
        view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.topAnchor.constraint(equalTo: movieTableView.topAnchor, constant: 10),
            spinner.centerXAnchor.constraint(equalTo: movieTableView.centerXAnchor)
        ])
    }
    
    // MARK: - Search functions
    private func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func isMovieFiltering() -> Bool {
        return searchController.isActive && !(isSearchBarEmpty())
    }

}

// MARK: - Search View Protocol
extension SearchViewController: SearchViewProtocol {
    
    func handleOutput(_ output: SearchPresenterOutput) {
        switch output {
        case .showMovies(let result):
            movies = result
            movieTableView.reloadData()
        case .showSearchedMovies(let result):
            filteredMovies = result
            movieTableView.reloadData()
        }
        spinner.stopAnimating()
    }
    
}

// MARK: - Search Results Updating
extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return }
        spinner.startAnimating()
        presenter?.searchMovie(query: text)
    }
    
}

// MARK: - Search Bar Delegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if isSearchBarEmpty() { presenter?.load() }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.load()
    }
    
}

// MARK: - Table View Delegates
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.selectMovie(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isMovieFiltering() { return filteredMovies.count }
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchMovieTableViewCell.identifier, for: indexPath) as? SearchMovieTableViewCell else { return UITableViewCell() }
        if isMovieFiltering() {
            cell.configure(with: filteredMovies[indexPath.row])
        } else {
            cell.configure(with: movies[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
