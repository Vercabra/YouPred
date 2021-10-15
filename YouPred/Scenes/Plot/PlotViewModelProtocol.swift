//
//  PlotViewModelProtocol.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

protocol PlotViewModelProtocol {
    var data: [[Double]] { get }
}

class PlotViewModel: BaseViewModel, PlotViewModelProtocol {
    var data: [[Double]] {
        var data: [[Double]] = []
        for _ in 0...100 {
            data.append([Double.random(in: 0...100), Double.random(in: 0...100)])
        }
        return data
    }
}

