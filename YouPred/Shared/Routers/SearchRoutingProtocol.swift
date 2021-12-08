//
//  SearchRoutingProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 22.11.2021.
//

protocol SearchRoutingProtocol {
    func routeToPlot(animated: Bool)
    func routeToAuthorization()
}

extension BaseRouting: SearchRoutingProtocol {
    
    func routeToPlot(animated: Bool) {
        do {
            let viewModel: PlotViewModelProtocol = try viewModelsFactory.buildViewModel()
            let vc = try viewsFactory.buildView(viewModel) as PlotViewController
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
