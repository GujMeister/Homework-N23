import Foundation

class MainViewControllerModel {
    
    var catFacts: [Datum] = [] {
        didSet { onCatFactsUpdated?() }
    }

    var onCatFactsUpdated: (() -> Void)?
    
    public func didLoad() {
        getFacts()
    }
    
    private func getFacts() {
        fetchAllCatFacts()
    }

    private func fetchAllCatFacts() {
        fetchData(from: "https://catfact.ninja/facts", resultType: CatFactAPIResponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                if !response.links.isEmpty {
                    let urls = response.links.compactMap { $0.url }
                    print("🔥", urls, "🔥")
                    self?.fetchOnlyCatFacts(from: urls)
                } else {
                    print("No URLs found")
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }

    private func fetchOnlyCatFacts(from urls: [String]) {
        let group = DispatchGroup()
        
        for url in urls {
            group.enter()
            fetchData(from: url, resultType: CatFactModel.self) { [weak self] result in
                defer { group.leave() }
                
                switch result {
                case .success(let fact):
                    if let data = fact.data {
                        self?.catFacts.append(contentsOf: data)
                        print("✅", self?.catFacts as Any, "✅")
                    }
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }
        }
        
        group.notify(queue: .main) {
            print("All cat facts fetched, total N: \(self.catFacts.count)")
        }
    }
}
