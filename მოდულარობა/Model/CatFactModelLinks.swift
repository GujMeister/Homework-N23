import Foundation

struct CatFactAPIResponse: Codable {
    let links: [Links]
}

struct Links: Codable {
    let url: String?
    let label: String?
}
