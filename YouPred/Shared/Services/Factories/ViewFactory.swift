//
//  ViewFactory.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol ViewFactoryProtocol {
    func buildView<T>() throws -> T
    func buildView<T, U>(_ arguments: U) throws -> T
}

extension DependencyContainer: ViewFactoryProtocol {

    func buildView<T>() throws -> T {
        return try resolve()
    }
    
    func buildView<T, U>(_ arguments: U) throws -> T {
        return try resolve(arguments: arguments)
    }
}

