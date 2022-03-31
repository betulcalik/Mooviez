//
//  SearchRouter.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

class SearchRouter: SearchRouterProtocol {
    
    static func build() -> SearchViewProtocol {
        let view: SearchViewProtocol = SearchViewController()
        let interactor: SearchInteractorProtocol = SearchInteractor()
        let router: SearchRouterProtocol = SearchRouter()
        let presenter: SearchPresenterProtocol = SearchPresenter(view: view,
                                                                 interactor: interactor,
                                                                 router: router)
        view.presenter = presenter
        return view
    }
}
