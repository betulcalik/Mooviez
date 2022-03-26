//
//  VerticalMoviesCollectionViewCell.swift
//  mooviez
//
//  Created by Betül Çalık on 14.03.2022.
//

import UIKit

class VerticalMoviesCollectionViewCell: UICollectionViewCell {
    
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
        label.font = R.font.montserratBold(size: 24)
        label.text = R.string.localizable.title_h_upcoming_movies()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Variables
    static let identifier = "VerticalMoviesCollectionViewCell"
    private let baseImageURL = "https://image.tmdb.org/t/p/w300"
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI
    private func setupUI() {
        addMovieImage()
        addMovieTitle()
        addShadowToTitle()
    }
    
    private func addMovieImage() {
        contentView.addSubview(movieImageView)
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func addMovieTitle() {
        contentView.addSubview(movieTitle)
        NSLayoutConstraint.activate([
            movieTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func addShadowToTitle() {
        movieTitle.layer.shadowColor = UIColor.black.cgColor
        movieTitle.layer.shadowRadius = 3.0
        movieTitle.layer.shadowOpacity = 1.0
        movieTitle.layer.shadowOffset = CGSize(width: 4, height: 4)
        movieTitle.layer.masksToBounds = false
    }
    
    // MARK: - Configure cell
    public func configure(with model: Movie) {
        guard let posterPath = model.backdropPath else { return }
        let urlString = baseImageURL + posterPath
        let url = URL(string: urlString)
        movieImageView.kf.setImage(with: url)
        movieTitle.text = model.originalTitle
    }
}
