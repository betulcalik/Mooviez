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
    
}
