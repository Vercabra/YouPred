//
//  BaseViewModel.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

class BaseViewModel {
    let viewModelFactoryContainer = Injected<ViewModelFactoryProtocol>()
    var viewModelFactory: ViewModelFactoryProtocol? { return viewModelFactoryContainer.wrappedValue }
    private var routing = Injected<RoutingProtocol>()
    var baseRouter: RoutingProtocol? {
        return routing.wrappedValue
    }
    var disposeBag = DisposeBag()
    
    init() {}
}

