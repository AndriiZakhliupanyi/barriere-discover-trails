import Foundation

enum Files: String {
    
    case items, tips
}

class LoadFileService {
    
    init() {}

    func loadItems<T: Codable>(file: Files) -> [T] {
        guard let url = Bundle.main.url(forResource: file.rawValue, withExtension: "json") else {
            print("Failed to locate \(file.rawValue).json in bundle.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedItems = try JSONDecoder().decode([T].self, from: data)
            return decodedItems
        } catch {
            print("Failed to decode \(file.rawValue).json: \(error)")
            return []
        }
    }
}
