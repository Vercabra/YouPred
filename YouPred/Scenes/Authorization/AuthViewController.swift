//
//  AuthViewController.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

class AuthViewController: BaseViewController, NonReusableViewProtocol, GIDSignInDelegate {
    @IBOutlet private weak var signInWithGoogleButton: GIDSignInButton!
    @IBOutlet private weak var titleCenterConstraint: NSLayoutConstraint!
    
    func didSetViewModel(_ viewModel: AuthViewModelProtocol) {
        configureGoogleSignIn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.titleCenterConstraint.constant = -150
            self.view.layoutIfNeeded()
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.4) {
                    self.signInWithGoogleButton.alpha = 1
                }
            }
        }
    }
    
    private func configureGoogleSignIn() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard let authentication = user?.authentication, let idToken = authentication.idToken else {
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                       accessToken: authentication.accessToken)
        viewModel?.signInWithGoogle(credentials: credential)
    }
}
