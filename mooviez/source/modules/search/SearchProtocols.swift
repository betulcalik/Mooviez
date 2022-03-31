//
//  SearchProtocols.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

// MARK: - View
protocol SearchViewProtocol: AnyObject {
    var presenter: SearchPresenterProtocol? { get set }
}

// MARK: - Interactor
protocol SearchInteractorProtocol: AnyObject {
    var presenter: SearchPresenterProtocol? { get set }
}

// MARK: - Presenter
protocol SearchPresenterProtocol: AnyObject {
    
}

// MARK: - Router
protocol SearchRouterProtocol: AnyObject {
    static func build() -> SearchViewProtocol
}
