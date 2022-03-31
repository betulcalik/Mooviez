//
//  HomeDetailRouter.swift
//  mooviez
//
//  Created by Betül Çalık on 26.03.2022.
//

import Foundation

class HomeDetailRouter: HomeDetailRouterProtocol {
    
    static func build(with movie: Movie) -> HomeDetailViewProtocol {
        let view: HomeDetailViewProtocol = HomeDetailViewController()
        let router: HomeDetailRouterProtocol = HomeDetailRouter()
        let presenter: HomeDetailPresenterProtocol = HomeDetailPresenter(view: view,
                                                                         movie: movie,
                                                                         router: router)
        view.presenter = presenter
        return view
    }
    
    func navigateToMovieVideo(with movieId: Int, on view: HomeDetailViewProtocol) {
        guard let viewController = view as? HomeDetailViewController else { return }
        guard let videoViewController = HomeVideoRouter.build(with: movieId) as? HomeVideoViewController else { return }
        
        viewController.navigationController?.pushViewController(videoViewController, animated: true)
    }
}
