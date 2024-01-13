import Foundation

struct EntertainmentResponse: Decodable{
    let id: String
    let title: String
    let thumbnail: String
    let year: Int
    let category: String
    let rating: String
    let isBookmarked: Bool
    let isTrending: Bool
}



struct EntertainmentJSONDecoder{
    static func decode(fileName: String) -> [EntertainmentResponse]{
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let entertainment = try? JSONDecoder().decode([EntertainmentResponse].self, from: data) else{
            return []
        }
        return entertainment
    }
}
