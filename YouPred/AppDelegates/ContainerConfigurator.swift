//
//  ContainerConfigurator.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

enum ContainerConfigurator {
    
    static var notificationCenter : NotificationCenter = try! container.resolve()
    static var container = DependencyContainer()
    
    static func configure(_ c: DependencyContainer) -> DependencyContainer {
        container = c
        registerServices(inContainer: c)
        registerFactories(inContainer: c)
        registerRouters(inContainer: c)
        registerViewModels(inContainer: c)
        registerViews(inContainer: c)
        registerMappers(inContainer: c)
        return c
    }
    
    static func registerServices(inContainer c: DependencyContainer) {
        c.register(.singleton) { RoutingTargetProvider(window: try c.resolve()) as RoutingTargetProviderProtocol }
        c.register(.singleton) { SessionService() as SessionServiceProtocol }
    }
    
    static func registerFactories(inContainer c: DependencyContainer) {
        c.register{ c as ViewFactoryProtocol }
        c.register{ c as ViewModelFactoryProtocol }
    }
    
    static func registerRouters(inContainer c: DependencyContainer) {
        c.register(.singleton) { BaseRouting(viewsFactory: try c.resolve(),
                                             viewModelsFactory: try c.resolve(),
                                             targetProvider: try c.resolve()) as RoutingProtocol }
    }
    
    static func registerViewModels(inContainer c: DependencyContainer) {
        c.register(.unique) { StartUpViewModel(sessionService: try c.resolve()) as StartUpViewModelProtocol }
        c.register(.unique) { AuthViewModel(mapper: try c.resolve()) as AuthViewModelProtocol }
        c.register(.unique) { PlotViewModel() as PlotViewModelProtocol }
    }
    
    static func registerViews(inContainer c: DependencyContainer) {
        func resolve<T, U: UIViewController>(_ vm: T) throws -> U where U:NonReusableViewProtocol, U.ViewModelProtocol == T {
            return try U.presenter().fromStoryboard(initial: true).configure({
                $0.viewModel = vm
            }).provideSourceController()
        }
        
        func resolveSingle<U: UIViewController>() throws -> U {
            return try U.presenter().fromStoryboard(initial: true).provideSourceController()
        }
        
        c.register(.singleton) {
            StartUpWindow(frame: UIScreen.main.bounds) as UIWindow
        }.resolvingProperties {
            if let sessionWindow = $1 as? StartUpWindow {
                sessionWindow.viewModel = try $0.resolve()
            }
        }
        
        c.register { (viewModel: AuthViewModelProtocol) ->  AuthViewController in try resolve(viewModel) }
        c.register { (viewModel: PlotViewModelProtocol) ->  PlotViewController in try resolve(viewModel) }
    }
    
    static func registerMappers(inContainer c: DependencyContainer) {
        c.register { AuthViewModelMapper() as AuthViewModelMapperProtocol }
    }
}
