//
//  HomeVideoProtocols.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

// MARK: - View
protocol HomeVideoViewProtocol: AnyObject {
    var presenter: HomeVideoPresenterProtocol? { get set }
    
    func handleOutput(_ output: HomeVideoPresenterOutput)
}

// MARK: - Interactor
protocol HomeVideoInteractorProtocol: AnyObject {
    var delegate: HomeVideoInteractorDelegate? { get set }
    var presenter: HomeVideoPresenterProtocol? { get set }
    
    func load()
}

protocol HomeVideoInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeVideoInteractorOutput)
}

enum HomeVideoInteractorOutput {
    case showVideo(MovieVideo)
}

// MARK: - Presenter
protocol HomeVideoPresenterProtocol: AnyObject {
    func load()
}

enum HomeVideoPresenterOutput {
    case showVideo(MovieVideo)
}

// MARK: - Router
protocol HomeVideoRouterProtocol: AnyObject {
    static func build(with movieId: Int) -> HomeVideoViewProtocol
}
