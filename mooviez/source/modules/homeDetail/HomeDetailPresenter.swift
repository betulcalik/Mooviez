//
//  HomeDetailPresenter.swift
//  mooviez
//
//  Created by Betül Çalık on 26.03.2022.
//

import Foundation

class HomeDetailPresenter: HomeDetailPresenterProtocol {
    
    // MARK: - Variables
    unowned var view: HomeDetailViewProtocol?
    private let interactor: HomeDetailInteractorProtocol
    private let router: HomeDetailRouterProtocol
    
    init(view: HomeDetailViewProtocol,
         interactor: HomeDetailInteractorProtocol,
         router: HomeDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}
