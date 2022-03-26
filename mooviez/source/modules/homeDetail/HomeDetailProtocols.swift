//
//  HomeDetailProtocols.swift
//  mooviez
//
//  Created by Betül Çalık on 26.03.2022.
//

import Foundation

// MARK: - View
protocol HomeDetailViewProtocol: AnyObject {
    var presenter: HomeDetailPresenterProtocol? { get set }
}

// MARK: - Interactor
protocol HomeDetailInteractorProtocol: AnyObject {
    
}

// MARK: - Presenter
protocol HomeDetailPresenterProtocol: AnyObject {
    
}

// MARK: - Router
protocol HomeDetailRouterProtocol: AnyObject {
    static func build() -> HomeDetailViewProtocol
}
