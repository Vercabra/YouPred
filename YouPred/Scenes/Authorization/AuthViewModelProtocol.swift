//
//  AuthViewModelProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol AuthViewModelProtocol {
    var mapper: AuthViewModelMapperProtocol { get }
}

class AuthViewModel: BaseViewModel, AuthViewModelProtocol, Routable {
    var router:  AuthRoutingProtocol? { return baseRouter }
    let mapper: AuthViewModelMapperProtocol
    
    init(mapper: AuthViewModelMapperProtocol) {
        self.mapper = mapper
        super.init()
        self.observeActions()
    }
    
    private func observeActions() {
        mapper.goNextButtonDidPress.asObservable().subscribe(onNext: { [weak self] in
            self?.router?.routeToPlot()
        }).disposed(by: disposeBag)
    }
}
