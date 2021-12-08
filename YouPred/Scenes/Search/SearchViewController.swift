//
//  SearchViewController.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 22.11.2021.
//

import UIKit

class SearchViewController: BaseViewController, NonReusableViewProtocol {
    @IBOutlet private weak var searchField: UITextField!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var filterButton: UIButton!
    @IBOutlet private weak var logoutButton: UIButton!

    func didSetViewModel(_ viewModel: SearchViewModelProtocol) {
        configureUI(viewModel)
        observeActions(viewModel)
    }
    
    private func configureUI(_ viewModel: SearchViewModelProtocol) {
        searchField.text = nil
        searchField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.15)]
        )
    }
    
    private func observeActions(_ viewModel: SearchViewModelProtocol) {
        searchField.rx.text.bind(to: viewModel.mapper.searchText)
            .disposed(by: viewModelDisposeBag)
        
        searchButton.rx.tap.bind(to: viewModel.actions.searchButtonDidPress)
            .disposed(by: viewModelDisposeBag)
        
        filterButton.rx.tap.bind(to: viewModel.actions.filterButtonDidPeess)
            .disposed(by: viewModelDisposeBag)
        
        logoutButton.rx.tap.bind(to: viewModel.actions.logoutButtonDidPress)
            .disposed(by: viewModelDisposeBag)
    }
}

