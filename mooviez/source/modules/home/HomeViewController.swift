//
//  HomeViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var contentViewSize = CGSize(width: view.frame.width,
                                              height: view.frame.height + 400)
    
    // MARK: - UI Components
    private lazy var upcomingTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.font.montserratBold(size: 30)
        label.text = R.string.localizable.title_upcoming_movies()
        label.textColor = R.color.titleColor()
        return label
    }()
    
    private lazy var upcomingMovies: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.clear
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var upcomingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var topRatedTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.font.montserratBold(size: 30)
        label.text = R.string.localizable.title_top_rated_movies()
        label.textColor = R.color.titleColor()
        return label
    }()
    
    private lazy var topRatedMovies: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.clear
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var topRatedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var trendingTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.font.montserratBold(size: 30)
        label.text = R.string.localizable.title_trending_movies()
        label.textColor = R.color.titleColor()
        return label
    }()
    
    private lazy var trendingMovies: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.clear
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var trendingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = contentViewSize
        scrollView.bounds = view.bounds
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Variables
    var presenter: HomePresenterProtocol?
    private var upcomingMoviesArray: [Movie] = []
    private var topRatedMoviesArray: [Movie] = []
    private var trendingMoviesArray: [Movie] = []
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
        addScrollView()
        addContentStackView()
        addUpcomingMovies()
        addTopRatedMovies()
        addTrendingMovies()
    }
    
    private func setView() {
        view.backgroundColor = R.color.backgroundColor()
        setMovies()
    }

    private func setMovies() {
        upcomingMovies.register(HorizontalMoviesCollectionViewCell.self,
                                forCellWithReuseIdentifier: HorizontalMoviesCollectionViewCell.identifier)
        topRatedMovies.register(HorizontalMoviesCollectionViewCell.self,
                                forCellWithReuseIdentifier: HorizontalMoviesCollectionViewCell.identifier)
        trendingMovies.register(VerticalMoviesCollectionViewCell.self,
                                forCellWithReuseIdentifier: VerticalMoviesCollectionViewCell.identifier)
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func addContentStackView() {
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    private func addUpcomingMovies() {
        upcomingStackView.addArrangedSubview(upcomingTitleLabel)
        upcomingStackView.addArrangedSubview(upcomingMovies)
        contentView.addSubview(upcomingStackView)
        NSLayoutConstraint.activate([
            upcomingStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            upcomingStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            upcomingStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addTopRatedMovies() {
        topRatedStackView.addArrangedSubview(topRatedTitleLabel)
        topRatedStackView.addArrangedSubview(topRatedMovies)
        contentView.addSubview(topRatedStackView)
        NSLayoutConstraint.activate([
            topRatedStackView.topAnchor.constraint(equalTo: upcomingStackView.bottomAnchor, constant: 20),
            topRatedStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            topRatedStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            topRatedStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addTrendingMovies() {
        trendingStackView.addArrangedSubview(trendingTitleLabel)
        trendingStackView.addArrangedSubview(trendingMovies)
        contentView.addSubview(trendingStackView)
        NSLayoutConstraint.activate([
            trendingStackView.topAnchor.constraint(equalTo: topRatedStackView.bottomAnchor, constant: 20),
            trendingStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            trendingStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            trendingStackView.heightAnchor.constraint(equalToConstant: 400)
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
        case .showTopRatedMovies(let result):
            self.topRatedMoviesArray = result
            topRatedMovies.reloadData()
        case .showTrendingMovies(let result):
            self.trendingMoviesArray = result
            trendingMovies.reloadData()
        }
    }
    
}

// MARK: - Collection View Delegates
extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.upcomingMovies {
            return upcomingMoviesArray.count
        } else if collectionView == self.topRatedMovies {
            return topRatedMoviesArray.count
        } else if collectionView == self.trendingMovies {
            return trendingMoviesArray.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.upcomingMovies {
            guard let cell = upcomingMovies.dequeueReusableCell(withReuseIdentifier: HorizontalMoviesCollectionViewCell.identifier, for: indexPath) as? HorizontalMoviesCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: upcomingMoviesArray[indexPath.row])
            return cell
        } else if collectionView == self.topRatedMovies {
            guard let cell = topRatedMovies.dequeueReusableCell(withReuseIdentifier: HorizontalMoviesCollectionViewCell.identifier, for: indexPath) as? HorizontalMoviesCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: topRatedMoviesArray[indexPath.row])
            return cell
        } else if collectionView == self.trendingMovies {
            guard let cell = trendingMovies.dequeueReusableCell(withReuseIdentifier: VerticalMoviesCollectionViewCell.identifier, for: indexPath) as? VerticalMoviesCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: trendingMoviesArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == trendingMovies {
            return CGSize(width: view.frame.width, height: view.frame.height / 4)
        }
        let width = view.frame.width / 2
        let height = view.frame.width / 3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
}
