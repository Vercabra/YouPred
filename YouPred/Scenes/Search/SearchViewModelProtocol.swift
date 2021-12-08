//
//  SearchViewModelProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 22.11.2021.
//

import UIKit

protocol SearchViewModelProtocol {
    var mapper: SearchViewModelMapperProtocol { get }
    var actions: SearchViewModelActions { get }
}

class SearchViewModelActions {
    let searchButtonDidPress: PublishSubject<Void> = .init()
    let filterButtonDidPeess: PublishSubject<Void> = .init()
    let logoutButtonDidPress: PublishSubject<Void> = .init()
}

class SearchViewModel: BaseViewModel, SearchViewModelProtocol {
    let mapper: SearchViewModelMapperProtocol
    let actions: SearchViewModelActions = .init()
    let session: Injected<SessionServiceProtocol> = .init()
    var router: SearchRoutingProtocol? { baseRouter }
    
    init(mapper: SearchViewModelMapperProtocol) {
        self.mapper = mapper
        super.init()
        self.observeActions()
    }
    
    private func observeActions() {
        actions.searchButtonDidPress.asObservable().subscribe(onNext: { [weak self] in
            self?.router?.routeToPlot(animated: true)
        }).disposed(by: disposeBag)
        
        actions.filterButtonDidPeess.asObservable().subscribe(onNext: { [weak self] in
            self?.showFilterView()
        }).disposed(by: disposeBag)
        
        actions.logoutButtonDidPress.asObservable().subscribe(onNext: { [weak self] in
            self?.session.wrappedValue?.logout()
            self?.router?.routeToAuthorization()
        }).disposed(by: disposeBag)
    }
    
    private func showFilterView() {
        let filterView = SearchFilterView()
        filterView.configure()
        
        var attributes = EKAttributes()
        let translation = EKAttributes.Animation.Translate(duration: 0.2,
                                                           anchorPosition: .top,
                                                           delay: 0,
                                                           spring: nil)
        attributes.entranceAnimation = EKAttributes.Animation(translate: translation, scale: nil, fade: nil)
        attributes.position = .center
        attributes.displayDuration = .infinity
        attributes.positionConstraints.safeArea = .overridden
        attributes.entryInteraction = .absorbTouches
        attributes.screenInteraction = .absorbTouches
        let bgColor = EKColor(UIColor.white.withAlphaComponent(0.5))
        attributes.screenBackground = .color(color: bgColor)
        
        attributes.positionConstraints.size = .init(width: .constant(value: 350),
                                                    height: .constant(value: 295))
        SwiftEntryKit.display(entry: filterView, using: attributes)
    }
}
