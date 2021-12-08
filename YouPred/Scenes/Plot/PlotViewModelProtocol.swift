//
//  PlotViewModelProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

protocol PlotViewModelProtocol {
    var data: [[Double]] { get }
    func goBack()
}

class PlotViewModel: BaseViewModel, PlotViewModelProtocol {
    var router: SessionRoutingProtocol? { baseRouter }
    
    var data: [[Double]] {
        var data: [[Double]] = []
        for _ in 0...100 {
            data.append([Double.random(in: 0...100), Double.random(in: 0...100)])
        }
        return data
    }
    
    func goBack() {
        router?.routeBack()
    }
}

