//
//  AuthViewModelProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol AuthViewModelProtocol {
}

class AuthViewModel: BaseViewModel, AuthViewModelProtocol, Routable {
    var router:  SessionRoutingProtocol? { return baseRouter }
}
