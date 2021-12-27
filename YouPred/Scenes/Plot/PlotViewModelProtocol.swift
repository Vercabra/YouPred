//
//  PlotViewModelProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

protocol PlotViewModelProtocol {
    var data: [[Double]]! { get set }
    func goBack()
}

class PlotViewModel: BaseViewModel, PlotViewModelProtocol {
    var router: SessionRoutingProtocol? { baseRouter }
    
    var data: [[Double]]!
    
    func goBack() {
        router?.routeBack()
    }
}

