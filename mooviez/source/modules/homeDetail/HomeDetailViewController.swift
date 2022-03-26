//
//  HomeDetailViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 26.03.2022.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var contentViewSize = CGSize(width: view.frame.width,
                                              height: view.frame.height + 200)
    
    // MARK: - UI Components
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = R.font.montserratBold(size: 20)
        label.textColor = .white
        label.textAlignment = .left
        return label
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
    var presenter: HomeDetailPresenterProtocol?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = R.color.backgroundColor()
        setNavigationBar()
        addScrollView()
        addContentStackView()
        addMovieImage()
        addMovieTitle()
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = R.string.localizable.title_hd_back_button()
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
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
    
    private func addMovieImage() {
        contentView.addSubview(movieImageView)
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: contentViewSize.height / 2.5)
        ])
    }
    
    private func addMovieTitle() {
        contentView.addSubview(movieTitle)
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -25),
            movieTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
 
}

// MARK: - Home Detail View Protocol
extension HomeDetailViewController: HomeDetailViewProtocol {
    
}
