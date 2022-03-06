//
//  HomeViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.montserratBold(size: 14)
        return label
    }()
    
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
        layout.scrollDirection = .horizontal
        upcomingMoviesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let upcomingMoviesCollectionView = upcomingMoviesCollectionView else { return }
        upcomingMoviesCollectionView.register(UpcomingMoviesCollectionViewCell.self,
                                        forCellWithReuseIdentifier: UpcomingMoviesCollectionViewCell.identifier)
        upcomingMoviesCollectionView.delegate = self
        upcomingMoviesCollectionView.dataSource = self
        upcomingMoviesCollectionView.backgroundColor = UIColor.clear
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
            upcomingMoviesCollectionView?.reloadData()
        }
    }
    
}

// MARK: - Collection View Delegate & Data Source & Layout
extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = upcomingMoviesCollectionView?.dequeueReusableCell(withReuseIdentifier: UpcomingMoviesCollectionViewCell.identifier, for: indexPath) else { return UICollectionViewCell() }
        cell.contentView.backgroundColor = .blue
        return cell
    }

}
