//
//  AuthRoutingProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol AuthRoutingProtocol {
    func routeToAuthorization()
    func routeToSearch(animated: Bool)
}

extension BaseRouting: AuthRoutingProtocol {
    
    func routeToAuthorization() {
        do {
            let viewModel: AuthViewModelProtocol = try viewModelsFactory.buildViewModel()
            let vc = try viewsFactory.buildView(viewModel) as AuthViewController
            let navigation = UINavigationController(rootViewController: vc)
            navigation.isNavigationBarHidden = true
            targetProvider.rootViewController = navigation
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func routeToSearch(animated: Bool) {
        do {
            let viewModel: SearchViewModelProtocol = try viewModelsFactory.buildViewModel()
            let vc = try viewsFactory.buildView(viewModel) as SearchViewController
            let navigation = UINavigationController(rootViewController: vc)
            navigation.isNavigationBarHidden = true
            if animated {
                try vc.presenter().push(animated: true)
            } else {
                targetProvider.rootViewController = navigation
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
