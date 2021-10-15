//
//  AuthViewModelMapper.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

protocol AuthViewModelMapperProtocol {
    var goNextButtonDidPress: PublishSubject<Void> { get }
}

class AuthViewModelMapper: AuthViewModelMapperProtocol {
    let goNextButtonDidPress: PublishSubject<Void> = .init()
}
