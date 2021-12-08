//
//  API+Auth.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

//
//  API+Auth.swift
//  MicroRec
//
//  Created by Dmitriy Dmitriyev on 21.09.2021.
//

protocol AuthServiceProtocol {
    var currentUser: FirebaseAuth.User? { get }
    func getAuthorizationStatus() -> Single<(Auth, FirebaseAuth.User?)>
    func signIn(with googleCredentials: AuthCredential) -> Single<(AuthDataResult?, Error?)>
    func signOut()
}

class AuthService: AuthServiceProtocol {
    var currentUser: FirebaseAuth.User? { Auth.auth().currentUser }
    private var currentNonce: String? = nil
    
    func getAuthorizationStatus() -> Single<(Auth, FirebaseAuth.User?)> {
        return Single.create { event -> Disposable in
            Auth.auth().addStateDidChangeListener { (auth, user) in
                event(.success((auth, user)))
            }
            return Disposables.create()
        }
    }
    
    func signIn(with credentials: AuthCredential) -> Single<(AuthDataResult?, Error?)> {
        return Single.create { event -> Disposable in
            Auth.auth().signIn(with: credentials) { authResult, error in
                event(.success((authResult, error)))
            }
            return Disposables.create()
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
}
