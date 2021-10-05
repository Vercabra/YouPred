//
//  Injection.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 05.10.2021.
//

class Injection<T>: AutoInjectedPropertyBox {
    static var wrappedType: Any.Type { return T.self }
    
    let _value = BehaviorRelay<T?>(value: nil)
    var value : T {
        get {
            guard let value = _value.value else { fatalError("getting value before injection") }
            return value
        }
    }
    var onInject: Observable<T> {
        return _value.asObservable().filterNil().take(1)
    }
    
    func resolve(_ container: DependencyContainer) throws {
        _value.accept(try container.resolve())
    }
}

