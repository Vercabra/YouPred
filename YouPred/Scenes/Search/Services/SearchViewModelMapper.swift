//
//  SearchViewModelMapper.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 22.11.2021.
//

protocol SearchViewModelMapperProtocol {
    var searchText: BehaviorRelay<String?> { get }
}

class SearchViewModelMapper: SearchViewModelMapperProtocol {
    let searchText: BehaviorRelay<String?> = .init(value: nil)
}
