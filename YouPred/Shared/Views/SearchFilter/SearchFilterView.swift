//
//  SearchFilterView.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 22.11.2021.
//

class SearchFilterView: BaseLoadableView {
    @IBOutlet private weak var sortingControl: UISegmentedControl!
    @IBOutlet private weak var duranceControl: UISegmentedControl!
    
    func configure() {
        sortingControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        sortingControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        duranceControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        duranceControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
}
