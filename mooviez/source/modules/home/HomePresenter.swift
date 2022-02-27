//
//  HomePresenter.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    
    // MARK: - Variables
    unowned var view: HomeViewProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol,
         router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func load() {
        
    }
    
}
