//
//  AuthViewController.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

class AuthViewController: BaseViewController, NonReusableViewProtocol {
    @IBOutlet private weak var goNextButton: UIButton!
    
    func didSetViewModel(_ viewModel: AuthViewModelProtocol) {
        configureUI(viewModel)
        configurActions(viewModel)
    }
    
    private func configureUI(_ viewModel: AuthViewModelProtocol) {
        goNextButton.dropShadow(color: .white,
                                opacity: 0.4,
                                offset: CGSize(width: 0, height: 0),
                                radius: 8)
    }
    
    private func configurActions(_ viewModel: AuthViewModelProtocol) {
        goNextButton.rx.tap.asObservable().subscribe(onNext: {
            viewModel.mapper.goNextButtonDidPress.onNext(())
        }).disposed(by: viewModelDisposeBag)
    }
}
