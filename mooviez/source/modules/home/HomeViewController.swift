//
//  HomeViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    private lazy var upcomingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = R.font.montserratBold(size: 34)
        label.text = R.string.localizable.title_upcoming_movies()
        label.textColor = R.color.titleColor()
        return label
    }()
    
    private lazy var upcomingMovies: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: - Variables
    var presenter: HomePresenterProtocol?
    private var upcomingMoviesArray: [UpcomingMovie] = []
    private var minimumLineSpacing = 25.0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        presenter?.load()
        setView()
        addTitleView()
        addUpcomingMovies()
    }
    
    private func setView() {
        view.backgroundColor = R.color.backgroundColor()
        setUpcomingMovies()
    }
    
    private func addTitleView() {
        view.addSubview(upcomingTitleLabel)
        NSLayoutConstraint.activate([
            upcomingTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            upcomingTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            upcomingTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setUpcomingMovies() {
        upcomingMovies.register(UpcomingMoviesCollectionViewCell.self,
                                forCellWithReuseIdentifier: UpcomingMoviesCollectionViewCell.identifier)
    }
    
    private func addUpcomingMovies() {
        let height = view.frame.height / 6
        view.addSubview(upcomingMovies)
        NSLayoutConstraint.activate([
            upcomingMovies.topAnchor.constraint(equalTo: upcomingTitleLabel.bottomAnchor, constant: 20),
            upcomingMovies.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            upcomingMovies.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            upcomingMovies.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}

// MARK: - Home View Protocol
extension HomeViewController: HomeViewProtocol {
    
    func handleOutput(_ output: HomePresenterOutput) {
        switch output {
        case .showUpcomingMovies(let result):
            self.upcomingMoviesArray = result
            upcomingMovies.reloadData()
        }
    }
    
}

// MARK: - Collection View Delegates
extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingMoviesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = upcomingMovies.dequeueReusableCell(withReuseIdentifier: UpcomingMoviesCollectionViewCell.identifier, for: indexPath) as? UpcomingMoviesCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: upcomingMoviesArray[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        let height = view.frame.width / 3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
}
