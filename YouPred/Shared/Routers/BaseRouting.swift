//
//  BaseRouting.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol RoutingProtocol: SessionRoutingProtocol, AuthRoutingProtocol {}

class BaseRouting: BaseService, RoutingProtocol {
    let viewsFactory: ViewFactoryProtocol
    let viewModelsFactory: ViewModelFactoryProtocol
    let targetProvider: RoutingTargetProviderProtocol
    
    init(viewsFactory: ViewFactoryProtocol, viewModelsFactory: ViewModelFactoryProtocol,targetProvider: RoutingTargetProviderProtocol) {
        self.viewsFactory = viewsFactory
        self.viewModelsFactory = viewModelsFactory
        self.targetProvider = targetProvider
    }
    
    let sessionService = Injected<SessionServiceProtocol>()
    
    func routeToAppSettings() {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsUrl)
        }
    }
    
    func routeBack() {
        targetProvider.topViewController?.close()
    }
    
    func routeBack(animated: Bool, completion: (()->())?) {
        targetProvider.topViewController?.close(animated: animated, completion: completion)
    }
    
    func dismissToRoot(animated: Bool, completion: (()->())?) {
        if targetProvider.topViewController == (targetProvider.rootViewController as? UINavigationController)?.viewControllers.first {
            completion?()
        } else {
            targetProvider.rootViewController?.dismiss(animated: animated, completion: completion)
        }
    }
    
    func dismissToHome(animated: Bool, completion: (()->())?) {
        if targetProvider.topViewController == (targetProvider.rootViewController as? UINavigationController)?.viewControllers.first {
            completion?()
        } else {
            targetProvider.rootViewController?.dismiss(animated: animated, completion: completion)
            (targetProvider.rootViewController as? UINavigationController)?.popToRootViewController(animated: true, completion: completion)
        }
    }
    
    func present(vc: UIViewController) {
        targetProvider.topViewController?.present(vc, animated: true, completion: nil)
    }
    
    func presentActivity(_ vc: UIActivityViewController) {
        targetProvider.topViewController?.present(vc, animated: true, completion: nil)
    }
}

protocol Routable {
    associatedtype RoutingProtocol
    var router: RoutingProtocol? { get }
}

