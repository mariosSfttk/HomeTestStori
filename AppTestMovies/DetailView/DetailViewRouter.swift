//
//  DetailViewRouter.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit



protocol ProtocolDetailViewRouter {
    var view: (UIViewController & ProtocolDetailView)? { get set}
    static func start(results: Results) -> ProtocolDetailViewRouter
}

class DetailViewRouter: ProtocolDetailViewRouter {
    var view: (any UIViewController & ProtocolDetailView)?
    
    static func start(results: Results) -> any ProtocolDetailViewRouter {
        let router = DetailViewRouter()
        
        var view: ProtocolDetailView = DetailViewController()
        var presenter: ProtocolDetailViewPresenter = DetailViewPresenter()
        var interactor: ProtocolDetailViewInteractor = DetailViewInteractor()
        
        view.presenter = presenter
        view.results = results
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view as? (UIViewController & ProtocolDetailView)
        
        return router
    }
    
    
}
