//
//  PlotViewController.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

class PlotViewController: BaseViewController, NonReusableViewProtocol {
    @IBOutlet private weak var plotView: PlotView!
    
    func didSetViewModel(_ viewModel: PlotViewModelProtocol) {
        configureUI(viewModel)
    }
    
    private func configureUI(_ viewModel: PlotViewModelProtocol) {
        plotView.configurePlot(data: viewModel.data)
    }
}
