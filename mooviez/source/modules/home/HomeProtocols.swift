//
//  HomeProtocols.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

// MARK: - View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

// MARK: - Interactor
protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    
    func load()
}

enum HomeInteractorOutput {
    
}

// MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    func load()
}

enum HomePresenterOutput {
    
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    static func build() -> HomeViewProtocol
}
