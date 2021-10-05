//
//  ViewModelFactory.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

protocol ViewModelFactoryProtocol {
    func buildViewModel<T>() throws -> T
    func buildViewModel<T, U>(_ arg1: U) throws -> T
    func buildViewModel<T, U, F>(_ arg1: U, _ arg2: F) throws -> T
    func buildViewModel<T, U, F, G>(_ arg1: U, _ arg2: F, _ arg3: G) throws -> T
    func buildViewModel<T, U, F, G, Z>(_ arg1: U, _ arg2: F, _ arg3: G, _ arg4: Z) throws -> T
}

extension DependencyContainer: ViewModelFactoryProtocol {
    func buildViewModel<T>() throws -> T {
        return try resolve()
    }
    
    func buildViewModel<T, U>(_ arg1: U) throws -> T {
        return try resolve(arguments: arg1)
    }
    
    func buildViewModel<T, U, F>(_ arg1: U, _ arg2: F) throws -> T {
        return try resolve(arguments: arg1, arg2)
    }
    
    func buildViewModel<T, U, F, G>(_ arg1: U, _ arg2: F, _ arg3: G) throws -> T {
        return try resolve(arguments: arg1, arg2, arg3)
    }
    
    func buildViewModel<T, U, F, G, Z>(_ arg1: U, _ arg2: F, _ arg3: G, _ arg4: Z) throws -> T {
        return try resolve(arguments: arg1, arg2, arg3, arg4)
    }
}
