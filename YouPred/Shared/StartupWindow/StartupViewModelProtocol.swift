//
//  StartupViewModelProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol StartUpViewModelProtocol {
    func goToNext()
}

class StartUpViewModel: BaseViewModel, StartUpViewModelProtocol, Routable {
    var router: SessionRoutingProtocol? { baseRouter }
    let sessionService: SessionServiceProtocol
    
    init(sessionService: SessionServiceProtocol) {
        self.sessionService = sessionService
        super.init()
    }
    
    func goToNext() {
        if let user = Auth.auth().currentUser {
            sessionService.setup(user: user)
            router?.routeToMain()
        } else {
            router?.routeToAuth()
        }
    }
}
