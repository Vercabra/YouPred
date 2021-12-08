//
//  SessionServiceProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol SessionServiceProtocol {
    var user: BehaviorRelay<FirebaseAuth.User?> { get }
    func setup(user: FirebaseAuth.User)
    func logout()
}

class SessionService: BaseService, SessionServiceProtocol {
    let user: BehaviorRelay<FirebaseAuth.User?> = .init(value: nil)
    let authService: Injected<AuthServiceProtocol> = .init()
    
    override init() {
        super.init()
    }
    
    func setup(user: FirebaseAuth.User) {
        self.user.accept(user)
    }
    
    func logout() {
        user.accept(nil)
        authService.wrappedValue?.signOut()
    }
}

