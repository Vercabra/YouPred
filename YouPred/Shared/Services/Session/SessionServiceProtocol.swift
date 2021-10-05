//
//  SessionServiceProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol SessionServiceProtocol {
    var user: BehaviorRelay<User?> { get }
}

class SessionService: BaseService, SessionServiceProtocol {
    let user: BehaviorRelay<User?> = .init(value: nil)
    
    override init() {
        super.init()
    }
}

