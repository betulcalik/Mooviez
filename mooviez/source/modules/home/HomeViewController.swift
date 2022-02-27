//
//  HomeViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Components
    private var upcomingMoviesCollectionView: UICollectionView?
    
    // MARK: - Variables
    var presenter: HomePresenterProtocol?
    private var upcomingMovies: [UpcomingMovie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionViews()
        load()
    }

    private func load() {
        presenter?.load()
    }
    
    private func setupUI() {
        view.backgroundColor = .darkGray
    }
    
    private func setupCollectionViews() {
        setupUpcomingMoviesCollectionView()
    }
    
    private func setupUpcomingMoviesCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        upcomingMoviesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let upcomingMoviesCollectionView = upcomingMoviesCollectionView else { return }
        upcomingMoviesCollectionView.register(UpcomingMoviesCollectionViewCell.self,
                                              forCellWithReuseIdentifier: UpcomingMoviesCollectionViewCell.identifier)
        upcomingMoviesCollectionView.delegate = self
        upcomingMoviesCollectionView.dataSource = self
        upcomingMoviesCollectionView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
        
        view.addSubview(upcomingMoviesCollectionView)
    }

}

// MARK: - Home View Protocol
extension HomeViewController: HomeViewProtocol {
    
    func handleOutput(_ output: HomePresenterOutput) {
        switch output {
        case .showUpcomingMovies(let result):
            self.upcomingMovies = result
        }
    }
    
}

// MARK: - Collection View Delegate & Data Source & Layout
extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = upcomingMoviesCollectionView?.dequeueReusableCell(withReuseIdentifier: UpcomingMoviesCollectionViewCell.identifier, for: indexPath) else { return UICollectionViewCell() }
        cell.contentView.backgroundColor = .blue
        return cell
    }

}
