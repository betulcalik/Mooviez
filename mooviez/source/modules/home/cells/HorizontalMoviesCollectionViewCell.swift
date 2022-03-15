//
//  HorizontalMoviesCollectionViewCell.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import UIKit
import Kingfisher

class HorizontalMoviesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    // MARK: - Variables
    static let identifier = "UpcomingMoviesCollectionViewCell"
    private let baseImageURL = "https://image.tmdb.org/t/p/w300"
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = nil
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        contentView.addSubview(movieImageView)
    }

    // MARK: - Configure cell
    public func configure(with model: Movie) {
        guard let posterPath = model.backdropPath else { return }
        let urlString = baseImageURL + posterPath
        let url = URL(string: urlString)
        movieImageView.kf.setImage(with: url)
    }
}
