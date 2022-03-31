//
//  HomeVideoViewController.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import UIKit
import youtube_ios_player_helper

class HomeVideoViewController: UIViewController {

    // MARK: - UI Components
    private lazy var videoView: YTPlayerView = {
        let player = YTPlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        player.backgroundColor = .black
        return player
    }()
    
    // MARK: - Variables
    var presenter: HomeVideoPresenterProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        presenter?.load()
        setView()
        addVideoView()
    }
    
    private func setView() {
        view.backgroundColor = R.color.backgroundColor()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func addVideoView() {
        view.addSubview(videoView)
        NSLayoutConstraint.activate([
            videoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            videoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            videoView.heightAnchor.constraint(equalToConstant: 300),
            videoView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
}

// MARK: - Home Video View Protocol
extension HomeVideoViewController: HomeVideoViewProtocol {
    
    func handleOutput(_ output: HomeVideoPresenterOutput) {
        switch output {
        case .showVideo(let movieVideo):
            guard let key = movieVideo.key else { return }
            videoView.load(withVideoId: key)
        }
    }
    
}
