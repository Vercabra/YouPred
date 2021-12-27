//
//  API+Search.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 25.12.2021.
//

protocol SearchServiceProtocol {
    func search(string: String) -> Single<[[Double]]?>
}

class SearchService: SearchServiceProtocol {
    
    func search(string: String) -> Single<[[Double]]?> {
        return Single.create { [weak self] event -> Disposable in
            let data = self?.simulateSearch()
            event(.success(data))
            return Disposables.create()
        }
    }
    
    private func simulateSearch() -> [[Double]]? {
        var data: [[Double]] {
            var data: [[Double]] = []
            for _ in 0...15 {
                data.append([Double.random(in: 1...30), Double.random(in: 50...1250)])
            }

            return data.sorted { pair1, pair2 in
                pair1[0] < pair2[0]
            }
        }
        return data
    }

}
