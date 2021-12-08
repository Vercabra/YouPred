//
//  SessionRoutingProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol SessionRoutingProtocol {
    func routeToAuth()
    func routeToMain()
    func routeBack()
    
    func present(vc: UIViewController)
    func presentActivity(_ vc: UIActivityViewController)
}

extension BaseRouting: SessionRoutingProtocol {
    func routeToAuth() {
        routeToAuthorization()
    }
    
    func routeToMain() {
        routeToSearch(animated: false)
    }
}
