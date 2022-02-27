//
//  HomeRouter.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

final class HomeRouter: HomeRouterProtocol {
    
    static func build() -> HomeViewProtocol {
        let view: HomeViewProtocol = HomeViewController()
        let interactor: HomeInteractorProtocol = HomeInteractor()
        let router: HomeRouterProtocol = HomeRouter()
        let presenter: HomePresenterProtocol = HomePresenter(view: view,
                                                             interactor: interactor,
                                                             router: router)
        view.presenter = presenter
        return view
    }
    
}
