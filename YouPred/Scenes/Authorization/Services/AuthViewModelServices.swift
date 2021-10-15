//
//  AuthViewModelServices.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

protocol AuthViewModelServicesProtocol: class {
    var authService: AuthServiceProtocol { get }
    var sessionService: SessionServiceProtocol { get }
}

class AuthViewModelServices: BaseService, AuthViewModelServicesProtocol {
    var authService: AuthServiceProtocol
    var sessionService: SessionServiceProtocol
    
    init(authService: AuthServiceProtocol, sessionService: SessionServiceProtocol) {
        self.authService = authService
        self.sessionService = sessionService
    }
}
