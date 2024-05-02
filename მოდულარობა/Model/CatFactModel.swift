import Foundation

// MARK: - CatFactModel
struct CatFactModel: Codable {
    let currentPage: Int?
    let data: [Datum]?
    let firstPageUrl: String?
    let from, lastPage: Int?
    let lastPageUrl: String?
    let links: [Link]?
    let nextPageUrl, path, prevPageUrl: String?
    let perPage: Int?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageUrl = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageUrl = "last_page_url"
        case links
        case nextPageUrl = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageUrl = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct Datum: Codable {
    let fact: String?
    let length: Int?
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String?
    let active: Bool?
}
