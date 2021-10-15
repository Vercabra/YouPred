//
//  SessionServiceProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol SessionServiceProtocol {
    var user: BehaviorRelay<FirebaseAuth.User?> { get }
    func setup(user: FirebaseAuth.User)
}

class SessionService: BaseService, SessionServiceProtocol {
    let user: BehaviorRelay<FirebaseAuth.User?> = .init(value: nil)
    
    override init() {
        super.init()
    }
    
    func setup(user: FirebaseAuth.User) {
        self.user.accept(user)
    }
    
    func logout(router: RoutingProtocol?) {
        
    }
}

