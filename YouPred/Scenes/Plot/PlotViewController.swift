//
//  PlotViewController.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

import UIKit

class PlotViewController: BaseViewController, NonReusableViewProtocol {
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var plotView: PlotView!
    @IBOutlet private weak var viewsLabel: UILabel!
    
    func didSetViewModel(_ viewModel: PlotViewModelProtocol) {
        configureUI(viewModel)
        observeActions(viewModel)
    }
    
    private func configureUI(_ viewModel: PlotViewModelProtocol) {
        plotView.configurePlot(data: viewModel.data)
        viewsLabel.transform = CGAffineTransform(rotationAngle: -(Double.pi / 2))
    }
    
    private func observeActions(_ viewModel: PlotViewModelProtocol) {
        backButton.rx.tap.asObservable().subscribe(onNext: {
            viewModel.goBack()
        }).disposed(by: viewModelDisposeBag)
    }
}
