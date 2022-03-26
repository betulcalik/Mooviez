//
//  HomeDetailRouter.swift
//  mooviez
//
//  Created by Betül Çalık on 26.03.2022.
//

import Foundation

class HomeDetailRouter: HomeDetailRouterProtocol {
    
    static func build() -> HomeDetailViewProtocol {
        let view: HomeDetailViewProtocol = HomeDetailViewController()
        let interactor: HomeDetailInteractorProtocol = HomeDetailInteractor()
        let router: HomeDetailRouterProtocol = HomeDetailRouter()
        let presenter: HomeDetailPresenterProtocol = HomeDetailPresenter(view: view,
                                                                         interactor: interactor,
                                                                         router: router)
        view.presenter = presenter
        return view
    }
    
}
