//
//  AppDelegate.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let container = DependencyContainer()
    private var viewModel: StartUpViewModelProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ContainerConfigurator.configure(container)
        configureFirebase()
        configureWindow()
        configureKeyboard()
        return true
    }
    
    private func configureWindow() {
        window = try? container.resolve()
        window?.makeKeyAndVisible()
        if let startUpWindow = window as? StartUpWindow {
            viewModel = startUpWindow.viewModel
            viewModel?.goToNext()
        }
    }
    
    private func configureKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
    
    private func configureFirebase() {
        // FirebaseApp.configure()
    }
}

