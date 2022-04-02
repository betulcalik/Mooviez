//
//  SearchMovieTableViewCell.swift
//  mooviez
//
//  Created by Betül Çalık on 1.04.2022.
//

import UIKit

class SearchMovieTableViewCell: UITableViewCell {

    // MARK: - UI Components
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = R.font.montserratBold(size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Variables
    static let identifier = "SearchMovieTableViewCell"
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = R.color.backgroundColor()
        addMovieImage()
        addMovieTitle()
    }
    
    private func addMovieImage() {
        contentView.addSubview(movieImageView)
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func addMovieTitle() {
        contentView.addSubview(movieTitle)
        NSLayoutConstraint.activate([
            movieTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            movieTitle.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
            movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    // MARK: - Configure cell
    public func configure(with model: Movie) {
        guard let posterPath = model.backdropPath else { return }
        let urlString = MovieManager.shared.imageBaseURL + posterPath
        let url = URL(string: urlString)
        movieImageView.kf.setImage(with: url)
        movieTitle.text = model.title
    }
}
