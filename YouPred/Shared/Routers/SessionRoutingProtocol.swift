//
//  SessionRoutingProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol SessionRoutingProtocol {
    func routeToAuth()
    func routeToMain(animated: Bool)
    
    func present(vc: UIViewController)
    func presentActivity(_ vc: UIActivityViewController)
}

extension BaseRouting: SessionRoutingProtocol {
    func routeToAuth() {
        routeToAuthorization()
    }
    
    func routeToMain(animated: Bool) {
    }
}
