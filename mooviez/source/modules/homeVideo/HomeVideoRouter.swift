//
//  HomeVideoRouter.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

class HomeVideoRouter: HomeVideoRouterProtocol {
    
    static func build(with movieId: Int) -> HomeVideoViewProtocol {
        let view: HomeVideoViewProtocol = HomeVideoViewController()
        let interactor: HomeVideoInteractorProtocol = HomeVideoInteractor(movieId: movieId)
        let router: HomeVideoRouterProtocol = HomeVideoRouter()
        let presenter: HomeVideoPresenterProtocol = HomeVideoPresenter(view: view,
                                                                       interactor: interactor,
                                                                       router: router,
                                                                       movieId: movieId)
        view.presenter = presenter
        return view
    }
    
}
